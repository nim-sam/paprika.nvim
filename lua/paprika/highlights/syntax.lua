local utils = require("paprika.utils")

local function with_style(spec, style_opts)
    return utils.apply_style(spec, style_opts)
end

local function link(target)
    return { link = target }
end

local M = {}

function M.get(colors, config)
    local styles = config.styles or {}
    local highlights = {}

    highlights.Comment = with_style({ fg = colors.lighter_black, italic = true }, styles.comments)
    highlights.Constant = { fg = colors.orange }
    highlights.String = { fg = colors.green }
    highlights.Character = { fg = colors.green }
    highlights.Number = { fg = colors.green }
    highlights.Boolean = { fg = colors.green }
    highlights.Float = { fg = colors.green }

    highlights.Identifier = with_style({ fg = colors.norm }, styles.variables)
    highlights.Function = with_style({ fg = colors.accent, italic = true }, styles.functions)

    highlights.Statement = with_style({ fg = colors.fg }, styles.keywords)
    highlights.Conditional = { fg = colors.blue, bold = true }
    highlights.Repeat = { fg = colors.blue, bold = true }
    highlights.Label = { fg = colors.norm }
    highlights.Operator = { fg = colors.norm }
    highlights.Keyword = with_style({ fg = colors.fg }, styles.keywords)
    highlights.Exception = with_style({ fg = colors.fg }, styles.keywords)
    highlights.Include = { fg = colors.blue, bold = true }

    highlights.PreProc = { fg = colors.norm_subtle }
    highlights.Define = link("PreProc")
    highlights.Macro = { fg = colors.accent }
    highlights.PreCondit = link("PreProc")

    highlights.Type = { fg = colors.orange }
    highlights.StorageClass = { fg = colors.fg }
    highlights.Structure = link("Type")
    highlights.Typedef = link("Type")

    highlights.Special = { fg = colors.accent }
    highlights.SpecialChar = { fg = colors.accent }
    highlights.Tag = { fg = colors.accent }
    highlights.Delimiter = { fg = colors.norm_subtle }
    highlights.SpecialComment = { fg = colors.info }
    highlights.Debug = { fg = colors.norm_subtle }

    highlights.Underlined = { fg = colors.norm, underline = true }
    highlights.Ignore = { fg = colors.bg }
    highlights.Error = { fg = colors.error }
    highlights.Todo = { fg = colors.accent, bold = true }
    highlights.SpecialKey = { fg = colors.green }
    highlights.NonText = { fg = colors.lighter_black }
    highlights.Directory = { fg = colors.norm, bold = true }

    highlights.Title = { fg = colors.norm, bold = true }
    highlights.Special = { fg = colors.norm_subtle, italic = true }

    highlights.MarkdownCode = { fg = colors.green, bg = colors.bg_subtle }
    highlights.MarkdownLinkReference = { fg = colors.info }
    highlights.MarkdownJekyllFrontMatter = { fg = colors.norm_subtle }
    highlights.MarkdownCodeBlock = { fg = colors.norm }
    highlights.MarkdownCodeDelimiter = { fg = colors.norm }
    highlights.MarkdownHeadingDelimiter = { fg = colors.fg }
    highlights.MarkdownRule = { fg = colors.bg_subtle }
    highlights.MarkdownHeadingRule = { fg = colors.norm }
    highlights.MarkdownId = { fg = colors.info }
    highlights.MarkdownBlockquote = { fg = colors.norm_subtle, italic = true }
    highlights.MarkdownItalic = with_style({ fg = colors.norm }, { italic = true })
    highlights.MarkdownBold = with_style({ fg = colors.norm }, { bold = true })
    highlights.MarkdownInlineURL = with_style({ fg = colors.info, underline = true }, { italic = true })
    highlights.MarkdownListItem = { fg = colors.fg }
    highlights.MarkdownOrderedListMarker = { fg = colors.fg }
    highlights.MarkdownLinkText = with_style({ fg = colors.info }, { bold = true })
    highlights.MarkdownLinkDelimiter = { fg = colors.norm }
    highlights.MarkdownUrl = with_style({ fg = colors.info, underline = true }, { italic = true })

    highlights.htmlH1 = { fg = colors.fg, bold = true }
    highlights.htmlH2 = link("htmlH1")
    highlights.htmlH3 = link("htmlH1")
    highlights.htmlH4 = link("htmlH1")
    highlights.htmlH5 = link("htmlH1")
    highlights.htmlH6 = link("htmlH1")
    highlights.mkdDelimiter = { fg = colors.fg }
    highlights.mkdBold = link("MarkdownBold")
    highlights.mkdInlineURL = link("MarkdownInlineURL")
    highlights.mkdListItem = link("MarkdownListItem")
    highlights.mkdLink = link("MarkdownLinkText")
    highlights.mkdURL = link("MarkdownUrl")

    return highlights
end

return M
