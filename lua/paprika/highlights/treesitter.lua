local fn = require("paprika.fn")
local utils = require("paprika.utils")

local M = {}

local function apply_style(base, style_opts)
    if not style_opts or fn.is_empty(style_opts) then
        return base
    end
    return utils.apply_style(base, style_opts)
end

local function link(target)
    return { link = target }
end

function M.get(colors, config)
    local integrations = config.integrations or {}
    if integrations.treesitter == false then
        return {}
    end

    local styles = config.styles or {}
    local spec = {}

    spec["@comment"] = { fg = colors.lighter_black, italic = true }
    spec["@string.documentation.python"] = { fg = colors.lighter_black, italic = true }
    spec["@punctuation"] = { fg = colors.norm }
    spec["@punctuation.delimiter"] = { fg = colors.norm }
    spec["@punctuation.bracket"] = { fg = colors.norm }
    spec["@punctuation.special"] = { fg = colors.accent }

    spec["@constant"] = link("Constant")
    spec["@constant.builtin"] = link("Constant")
    spec["@constant.macro"] = link("Constant")
    spec["@string"] = { fg = colors.green }
    spec["@string.regex"] = { fg = colors.orange }
    spec["@string.escape"] = { fg = colors.accent }
    spec["@string.special"] = { fg = colors.accent }
    spec["@character"] = link("Character")
    spec["@number"] = link("Number")
    spec["@boolean"] = link("Boolean")
    spec["@float"] = link("Float")

    spec["@function"] = apply_style({ fg = colors.accent, italic = true }, styles.functions)
    spec["@function.builtin"] = { fg = colors.orange }
    spec["@function.macro"] = { fg = colors.accent }
    spec["@method"] = spec["@function"]
    spec["@constructor"] = { fg = colors.fg }
    spec["@parameter"] = apply_style({ fg = colors.norm }, styles.variables)
    spec["@parameter.reference"] = { fg = colors.norm }

    spec["@field"] = { fg = colors.norm_subtle }
    spec["@property"] = { fg = colors.norm_subtle }
    spec["@variable"] = apply_style({ fg = colors.norm }, styles.variables)
    spec["@variable.builtin"] = { fg = colors.accent }
    spec["@variable.parameter"] = spec["@parameter"]
    spec["@symbol"] = link("Identifier")

    spec["@type"] = link("Type")
    spec["@type.definition"] = link("Type")
    spec["@type.builtin"] = { fg = colors.orange }
    spec["@type.qualifier"] = link("Keyword")
    spec["@storageclass"] = link("StorageClass")
    spec["@attribute"] = { fg = colors.accent }
    spec["@annotation"] = link("PreProc")
    spec["@namespace"] = { fg = colors.norm }

    spec["@text"] = { fg = colors.norm }
    spec["@text.emphasis"] = { fg = colors.norm, italic = true }
    spec["@text.strong"] = { fg = colors.norm, bold = true }
    spec["@text.underline"] = { fg = colors.norm, underline = true }
    spec["@text.strike"] = { fg = colors.norm, strikethrough = true }
    spec["@text.title"] = { fg = colors.fg, bold = true }
    spec["@text.literal"] = { fg = colors.norm_subtle }
    spec["@text.reference"] = { fg = colors.info }
    spec["@text.uri"] = { fg = colors.info, underline = true }
    spec["@text.note"] = { fg = colors.info }
    spec["@text.warning"] = { fg = colors.warn }
    spec["@text.danger"] = { fg = colors.error }

    spec["@tag"] = { fg = colors.accent }
    spec["@tag.delimiter"] = { fg = colors.norm_subtle }
    spec["@tag.attribute"] = { fg = colors.norm }

    spec["@keyword"] = apply_style({ fg = colors.fg }, styles.keywords)
    spec["@keyword.operator"] = link("Operator")
    spec["@keyword.function"] = spec["@keyword"]
    spec["@keyword.return"] = spec["@keyword"]
    spec["@keyword.repeat"] = { fg = colors.blue, bold = true }
    spec["@keyword.conditional"] = { fg = colors.blue, bold = true }
    spec["@keyword.import"] = { fg = colors.blue, bold = true }
    spec["@conditional"] = { fg = colors.blue, bold = true }
    spec["@repeat"] = { fg = colors.blue, bold = true }
    spec["@debug"] = link("Debug")
    spec["@exception"] = spec["@keyword"]

    spec["@operator"] = link("Operator")
    spec["@label"] = link("Label")

    spec["@comment.todo"] = { fg = colors.accent, bold = true }
    spec["@comment.note"] = { fg = colors.info }
    spec["@comment.warning"] = { fg = colors.warn }
    spec["@comment.error"] = { fg = colors.error }

    return spec
end

return M
