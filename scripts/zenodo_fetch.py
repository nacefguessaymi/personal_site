#!/usr/bin/env python3
"""
Build-time Zenodo pipeline for posters and talks.

Input:  data/talks/<slug>.toml      (committed, you write these)
Output: static/zenodo/<slug>/thumb.webp
        static/zenodo/<slug>/web.pdf
        data/zenodo/<slug>.json      (generated metadata for Hugo templates)

Derivatives are cached by the source file's MD5 in CACHE_DIR, so each
original is downloaded only when it changes on Zenodo.

Requires: python3, Pillow, pypdfium2, and Ghostscript (`gs`) on PATH.
"""

import hashlib
import json
import shutil
import subprocess
import sys
import tomllib
import urllib.parse
import urllib.request
from pathlib import Path

import pypdfium2 as pdfium
from PIL import Image

ROOT = Path(__file__).resolve().parent.parent
INPUT_DIR = ROOT / "data" / "talks"
STATIC_OUT = ROOT / "static" / "zenodo"
DATA_OUT = ROOT / "data" / "zenodo"
CACHE_DIR = ROOT / ".zenodo-cache"

API = "https://zenodo.org/api/records"
USER_AGENT = "nacefguessaymi.com build (github.com/nacefguessaymi/personal_site)"

COMPRESS_OVER_BYTES = 10 * 1024 * 1024  # only run gs on files > 10 MB
THUMB_WIDTH = 1200  # px; displayed ~400-600 px, 2x for retina
THUMB_QUALITY = 82
GS_PRESET = "/ebook"  # 150 dpi; use /printer for 300 dpi
# Bump when thumbnail/compression settings change, to invalidate the cache.
PIPELINE_VERSION = "1"


def log(msg):
    print(f"[zenodo] {msg}", flush=True)


def http_get(url):
    req = urllib.request.Request(url, headers={"User-Agent": USER_AGENT})
    return urllib.request.urlopen(req, timeout=120)


def fetch_record(record_id):
    with http_get(f"{API}/{record_id}") as r:
        return json.load(r)


def file_entries(record):
    """Return {key: entry} for either Zenodo response shape.

    The public /api/records/{id} endpoint returns `files` as a list of
    {key, size, checksum, links}; the InvenioRDM-native shape is
    {"entries": {key: {...}}}. Handle both.
    """
    files = record.get("files") or []
    if isinstance(files, dict):
        files = list(files.get("entries", {}).values())
    return {f["key"]: f for f in files}


def pick_file(record, wanted):
    files = file_entries(record)
    if wanted:
        if wanted not in files:
            raise SystemExit(
                f"file '{wanted}' not in record {record['id']}: {list(files)}"
            )
        return files[wanted]
    pdfs = [f for k, f in files.items() if k.lower().endswith(".pdf")]
    if len(pdfs) != 1:
        raise SystemExit(
            f'record {record["id"]} has {len(pdfs)} PDFs; set `file = "..."` in its toml'
        )
    return pdfs[0]


def download(record_id, entry, dest, expected_md5):
    url = (
        entry.get("links", {}).get("self")
        or f"{API}/{record_id}/files/{urllib.parse.quote(entry['key'])}/content"
    )
    key = entry["key"]
    md5 = hashlib.md5()
    with http_get(url) as r, open(dest, "wb") as f:
        while chunk := r.read(1 << 20):
            md5.update(chunk)
            f.write(chunk)
    if md5.hexdigest() != expected_md5:
        raise SystemExit(
            f"MD5 mismatch for {key}: got {md5.hexdigest()}, want {expected_md5}"
        )


def make_thumb(pdf_path, out_path):
    doc = pdfium.PdfDocument(str(pdf_path))
    page = doc[0]
    scale = THUMB_WIDTH / page.get_width()
    img = page.render(scale=scale).to_pil().convert("RGB")
    img.save(out_path, "WEBP", quality=THUMB_QUALITY, method=6)
    doc.close()


def make_web_pdf(src, out_path):
    if src.stat().st_size <= COMPRESS_OVER_BYTES:
        shutil.copyfile(src, out_path)
        return
    subprocess.run(
        [
            "gs",
            "-sDEVICE=pdfwrite",
            f"-dPDFSETTINGS={GS_PRESET}",
            "-dNOPAUSE",
            "-dBATCH",
            "-dQUIET",
            f"-sOutputFile={out_path}",
            str(src),
        ],
        check=True,
    )
    # Never serve something bigger than the original.
    if out_path.stat().st_size >= src.stat().st_size:
        shutil.copyfile(src, out_path)


def process(slug, cfg):
    record = fetch_record(cfg["record"])
    entry = pick_file(record, cfg.get("file"))
    md5 = entry["checksum"].removeprefix("md5:")
    key = entry["key"]

    cache = CACHE_DIR / f"{md5}-v{PIPELINE_VERSION}"
    if (cache / "thumb.webp").exists() and (cache / "web.pdf").exists():
        log(f"{slug}: cache hit ({key})")
    else:
        log(f"{slug}: downloading {key} ({entry['size'] / 1e6:.1f} MB)")
        cache.mkdir(parents=True, exist_ok=True)
        src = cache / "source.pdf"
        download(cfg["record"], entry, src, md5)
        make_thumb(src, cache / "thumb.webp")
        make_web_pdf(src, cache / "web.pdf")
        src.unlink()  # don't keep originals in the cache
        log(f"{slug}: web.pdf {(cache / 'web.pdf').stat().st_size / 1e6:.1f} MB")

    out = STATIC_OUT / slug
    out.mkdir(parents=True, exist_ok=True)
    for name in ("thumb.webp", "web.pdf"):
        shutil.copyfile(cache / name, out / name)

    meta = record.get("metadata", {})
    creators = [
        c.get("name") or c.get("person_or_org", {}).get("name", "")
        for c in meta.get("creators", [])
    ]
    doi = (
        record.get("doi")
        or meta.get("doi")
        or record.get("pids", {}).get("doi", {}).get("identifier", "")
    )
    links = record.get("links", {})
    w, h = Image.open(out / "thumb.webp").size
    DATA_OUT.mkdir(parents=True, exist_ok=True)
    (DATA_OUT / f"{slug}.json").write_text(
        json.dumps(
            {
                "slug": slug,
                "record": cfg["record"],
                "title": meta.get("title", ""),
                "date": meta.get("publication_date", ""),
                "creators": creators,
                "contributors": [
                    {"name": c.get("name", ""), "type": c.get("type", "")}
                    for c in meta.get("contributors", [])
                ],
                "type": meta.get("resource_type", {}).get("type", ""),
                "meeting": {
                    k: meta.get("meeting", {}).get(k, "")
                    for k in ("title", "acronym", "dates", "place", "url", "session")
                },
                "doi": doi,
                "zenodo_url": links.get("self_html")
                or links.get("html")
                or f"https://zenodo.org/records/{cfg['record']}",
                "original_size": entry["size"],
                "web_size": (out / "web.pdf").stat().st_size,
                "thumb": f"/zenodo/{slug}/thumb.webp",
                "thumb_width": w,
                "thumb_height": h,
                "pdf": f"/zenodo/{slug}/web.pdf",
            },
            indent=2,
        )
    )


def main():
    if not shutil.which("gs"):
        raise SystemExit("Ghostscript (gs) not found on PATH")
    configs = sorted(INPUT_DIR.glob("*.toml"))
    if not configs:
        log(f"no inputs in {INPUT_DIR}")
        return
    for path in configs:
        with open(path, "rb") as f:
            process(path.stem, tomllib.load(f))
    log(f"done: {len(configs)} item(s)")


if __name__ == "__main__":
    sys.exit(main())
