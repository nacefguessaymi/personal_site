// netlify/functions/pipeline.js
//
// Reads the pipeline "flows" tab from a Google Sheet server-side and returns
// only the flow rows as JSON. The sheet ID lives in a Netlify env var and is
// never sent to the browser.
//
// Required env var:  PIPELINE_SHEET_ID   (the sheet ID, not the full URL)
// Optional env var:  PIPELINE_TAB        (defaults to "flows")
//
// Runtime: Node 18+ (uses global fetch). If your build pins an older Node,
// bump it to 18 or 20 in Netlify → Site configuration → Environment.

exports.handler = async () => {
  const SHEET = process.env.PIPELINE_SHEET_ID;
  const TAB = process.env.PIPELINE_TAB || "flows";

  if (!SHEET) {
    return json(500, { error: "PIPELINE_SHEET_ID is not set." });
  }

  const query = "select A, B, C where A is not null and C > 0";
  const url =
    "https://docs.google.com/spreadsheets/d/" + SHEET +
    "/gviz/tq?tqx=out:csv&headers=1&sheet=" + encodeURIComponent(TAB) +
    "&tq=" + encodeURIComponent(query);

  try {
    const res = await fetch(url);
    if (!res.ok) {
      return json(502, {
        error: "Sheet fetch failed (" + res.status + "). Is it shared 'anyone with the link'?",
      });
    }
    const csv = await res.text();
    const flows = parseCsv(csv);

    return {
      statusCode: 200,
      headers: {
        "Content-Type": "application/json",
        // Cache at Netlify's edge for 5 min so page views don't hit Google every time
        "Cache-Control": "public, max-age=300, s-maxage=300",
      },
      body: JSON.stringify({ flows }),
    };
  } catch (e) {
    return json(502, { error: "Could not reach Google Sheets." });
  }
};

// Parse the gviz CSV into [[from, to, weight], ...].
// Rows without a positive numeric weight are dropped, which also removes the
// header row automatically.
function parseCsv(text) {
  const rows = [];
  for (const line of text.split(/\r?\n/)) {
    if (!line.trim()) continue;
    const cells = splitCsvLine(line);
    if (cells.length < 3) continue;
    const from = cells[0].trim();
    const to = cells[1].trim();
    const weight = Number(cells[2]);
    if (!from || !to || !isFinite(weight) || weight <= 0) continue;
    rows.push([from, to, weight]);
  }
  return rows;
}

// Minimal CSV line splitter that respects quoted fields (e.g. "Phone, screen").
function splitCsvLine(line) {
  const out = [];
  let cur = "";
  let quoted = false;
  for (let i = 0; i < line.length; i++) {
    const c = line[i];
    if (quoted) {
      if (c === '"' && line[i + 1] === '"') { cur += '"'; i++; }
      else if (c === '"') { quoted = false; }
      else { cur += c; }
    } else {
      if (c === '"') { quoted = true; }
      else if (c === ",") { out.push(cur); cur = ""; }
      else { cur += c; }
    }
  }
  out.push(cur);
  return out;
}

function json(status, obj) {
  return {
    statusCode: status,
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(obj),
  };
}
