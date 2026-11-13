const PATHS = [".pixi", ".zenodo-cache"];

module.exports = {
  async onPreBuild({ utils }) {
    for (const p of PATHS) await utils.cache.restore(p);
  },
  async onPostBuild({ utils }) {
    for (const p of PATHS) await utils.cache.save(p);
  },
};
