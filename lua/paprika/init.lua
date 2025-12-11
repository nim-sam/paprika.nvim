local config = require("paprika.config")
local highlights = require("paprika.highlights")
local palette = require("paprika.palette")
local templates = require("paprika.templates")
local utils = require("paprika.utils")

local M = {}

function M.setup(opts)
    config.set(opts)
end

function M.load(opts)
    local cfg = config.extend(opts or {})
    local colors = palette.build(cfg.style, cfg.palette_overrides)
    local spec, meta = highlights.collect(colors, cfg)
    spec = templates.apply(spec, colors, cfg)
    utils.apply_highlights(spec)
    if cfg.terminal_colors then
        utils.apply_terminal(colors)
    end
    -- expose statusline/lightline tables via meta when needed
    M._last_meta = meta
end

function M.lualine()
    return M._last_meta.lualine
end

return M
