local M = {}

local function set_color(group, params)
    local cmd = "hi! " .. group

    if params.guifg then
        cmd = string.format('%s guifg=%s', cmd, params.guifg)
    end

    if params.guibg then
        cmd = string.format('%s guibg=%s', cmd, params.guibg)
    end

    if params.gui then
        cmd = string.format('%s gui=%s', cmd, params.gui)
    end

    if params.guisp then
        cmd = string.format('%s guifg=%s', cmd, params.guisp)
    end

    vim.cmd(cmd)
end

local function set_colors(scheme)
    for group, params in pairs(scheme) do
        set_color(group, params)
    end
end

function M.setup()
    if vim.fn.exists('syntax_on') then
        vim.cmd('syntax reset')
    end

    local black = '#181818'
    local dark_hard = '#252525'
    local dark_medium = '#3B3B3B'
    local dark_soft = '#777777'
    local light_soft = '#BDBDBD'
    local light_medium = '#DEDEDE'
    local light_hard = '#E0E0E0'
    local white = '#EEEEEE'

    local red = '#ED4A46'
    local red_dark = '#520402'
    local blue_light = '#7DB4F2'
    local blue = '#368AEB'
    local green_light = '#95DAA4'
    local green = '#47BE61'
    local green_dark = '#193301'
    local yellow = '#DBB32D'
    local orange = '#E67F43'
    local cyan = '#3FC5B7'
    local brown = '#A06949'
    local purple = '#B884F0'

    local scheme = {
        -- Vim editor colors
        Normal = { guifg = light_medium, guibg = black },
        Bold = { gui = 'bold' },
        Debug = { guifg = red },
        Directory = { guifg = blue },
        Error = { guifg = black, guibg = red },
        ErrorMsg = { guifg = red, guibg = black },
        Exception = { guifg = red },
        FoldColumn = { guifg = cyan, guibg = black },
        Folded = { guifg = dark_soft, guibg = dark_hard },
        IncSearch = { guifg = dark_hard, guibg = orange, gui = 'none' },
        Italic = { gui = 'none' },
        Macro = { guifg = orange },
        MatchParen = { guibg = dark_soft },
        ModeMsg = { guifg = orange },
        MoreMsg = { guifg = orange },
        Question = { guifg = blue },
        Search = { guifg = dark_hard, guibg = yellow },
        Substitute = { guifg = dark_hard, guibg = yellow, gui = 'none' },
        SpecialKey = { guifg = dark_soft },
        TooLong = { guifg = red },
        Underlined = { guifg = red },
        Visual = { guibg = dark_medium },
        VisualNOS = { guifg = red },
        WarningMsg = { guifg = yellow },
        WildMenu = { guifg = red, guibg = yellow },
        Title = { guifg = blue, gui = 'none' },
        Conceal = { guifg = blue, guibg = black },
        Cursor = { guifg = black, guibg = light_medium },
        NonText = { guifg = dark_soft },
        LineNr = { guifg = light_soft, guibg = black },
        SignColumn = { guifg = light_soft, guibg = black },
        StatusLine = { guifg = light_soft, guibg = dark_medium, gui = 'none' },
        StatusLineNC = { guifg = dark_soft, guibg = dark_hard, gui = 'none' },
        VertSplit = { guifg = light_medium, guibg = black, gui = 'none' },
        ColorColumn = { guibg = dark_hard, gui = 'none' },
        CursorColumn = { guibg = dark_hard, gui = 'none' },
        CursorLine = { guibg = dark_hard, gui = 'none' },
        CursorLineNr = { guifg = light_soft, guibg = dark_hard },
        QuickFixLine = { guibg = dark_hard, gui = 'none' },
        PMenu = { guifg = light_medium, guibg = dark_hard, gui = 'none' },
        PMenuSel = { guifg = dark_hard, guibg = light_medium },
        TabLine = { guifg = dark_soft, guibg = dark_hard, gui = 'none' },
        TabLineFill = { guifg = dark_soft, guibg = dark_hard, gui = 'none' },
        TabLineSel = { guifg = orange, guibg = dark_hard, gui = 'none' },

        -- Standard syntax highlighting
        Boolean = { guifg = green },
        Character = { guifg = green },
        Comment = { guifg = dark_soft },
        Conditional = { guifg = blue },
        Constant = { guifg = green },
        Define = { guifg = orange, gui = 'none' },
        Delimiter = { guifg = light_medium },
        Float = { guifg = green },
        Function = { guifg = blue_light },
        Identifier = { guifg = light_medium, gui = 'none' },
        Include = { guifg = blue },
        Keyword = { guifg = blue },
        Label = { guifg = green },
        Number = { guifg = green },
        Operator = { guifg = green_light, gui = 'none' },
        PreProc = { guifg = orange },
        Repeat = { guifg = blue },
        Special = { guifg = light_medium },
        SpecialChar = { guifg = green_light},
        Statement = { guifg = blue },
        StorageClass = { guifg = purple },
        String = { guifg = green },
        Structure = { guifg = purple },
        Tag = { guifg = blue },
        Todo = { guifg = light_medium , guibg = blue },
        Type = { guifg = purple, gui = 'none' },
        Typedef = { guifg = purple },

        -- Diff highlighting
        DiffAdd = { guibg = green_dark },
        DiffChange = { guibg = dark_hard },
        DiffDelete = { guibg = red_dark },
        DiffText = { guifg = yellow, guibg = dark_hard },
        DiffAdded = { guifg = green },
        DiffFile = { guifg = red },
        DiffNewFile = { guifg = green },
        DiffLine = { guifg = yellow },
        DiffRemoved = { guifg = red },

        -- Git highlighting
        gitcommitOverflow = { guifg = yellow },
        gitcommitSummary = { guifg = green },
        gitcommitComment = { guifg = dark_soft },
        gitcommitUntracked = { guifg = dark_soft },
        gitcommitDiscarded = { guifg = dark_soft },
        gitcommitSelected = { guifg = dark_soft },
        gitcommitHeader = { guifg = light_soft },
        gitcommitSelectedType = { guifg = blue },
        gitcommitUnmergedType = { guifg = blue },
        gitcommitDiscardedType = { guifg = blue },
        gitcommitBranch = { guifg = orange, gui = 'bold' },
        gitcommitUntrackedFile = { guifg = yellow },
        gitcommitUnmergedFile = { guifg = red, gui = 'bold' },
        gitcommitDiscardedFile = { guifg = red, gui = 'bold' },
        gitcommitSelectedFile = { guifg = green, gui = 'bold' },

        -- GitGutter highlighting
        GitGutterAdd = { guifg = green, guibg = black },
        GitGutterChange = { guifg = blue, guibg = black },
        GitGutterDelete = { guifg = red, guibg = black },
        GitGutterChangeDelete = { guifg = purple, guibg = black },

        -- Spelling highlighting
        SpellBad = { gui = 'undercurl', guisp = red },
        SpellLocal = { gui = 'undercurl', guisp = cyan },
        SpellCap = { gui = 'undercurl', guisp = blue },
        SpellRare = { gui = 'undercurl', guisp = purple },

        LspReferenceText = { gui = 'underline', guisp = light_soft },
        LspReferenceRead = { gui = 'underline', guisp = light_soft },
        LspReferenceWrite = { gui = 'underline', guisp = light_soft },
        LspDiagnosticsDefaultError = { guifg = red, gui = 'none' },
        LspDiagnosticsDefaultWarning = { guifg = yellow, gui = 'none' },
        LspDiagnosticsDefaultInformation = { guifg = light_medium, gui = 'none' },
        LspDiagnosticsDefaultHint = { guifg = dark_soft, gui = 'none' },
        LspDiagnosticsUnderlineError = { gui = 'undercurl', guisp = red },
        LspDiagnosticsUnderlineWarning = { gui = 'undercurl', guisp = yellow },
        LspDiagnosticsUnderlineInformation = { gui = 'undercurl', guisp = cyan },
        LspDiagnosticsUnderlineHint = { gui = 'undercurl', guisp = dark_soft },

        TSAnnotation = { guifg = dark_soft, gui = 'none' },
        TSAttribute = { guifg = orange, gui = 'none' },
        TSBoolean = { guifg = green, gui = 'none' },
        TSCharacter = { guifg = green, gui = 'none' },
        TSComment = { guifg = dark_soft },
        TSConstructor = { guifg = purple, gui = 'none' },
        TSConditional = { guifg = blue, gui = 'none' },
        TSConstant = { guifg = green, gui = 'none' },
        TSConstBuiltin = { guifg = blue },
        TSConstMacro = { guifg = orange, gui = 'none' },
        TSError = { guifg = red, gui = 'none' },
        TSException = { guifg = orange, gui = 'none' },
        TSField = { guifg = cyan, gui = 'none' },
        TSFloat = { guifg = green, gui = 'none' },
        TSFunction = { guifg = blue_light, gui = 'none' },
        TSFuncBuiltin = { guifg = blue },
        TSFuncMacro = { guifg = cyan, gui = 'none' },
        TSInclude = { guifg = blue, gui = 'none' },
        TSKeyword = { guifg = blue, gui = 'none' },
        TSKeywordFunction = { guifg = blue, gui = 'none' },
        TSKeywordOperator = { guifg = blue, gui = 'none' },
        TSLabel = { guifg = orange, gui = 'none' },
        TSMethod = { guifg = blue_light, gui = 'none' },
        TSNamespace = { guifg = blue_light, gui = 'none' },
        TSNone = { guifg = dark_soft, gui = 'none' },
        TSNumber = { guifg = green, gui = 'none' },
        TSOperator = { guifg = green_light, gui = 'none' },
        TSParameter = { guifg = light_medium, gui = 'none' },
        TSParameterReference = { guifg = orange, gui = 'none' },
        TSProperty = { guifg = blue_light, gui = 'none' },
        TSPunctDelimiter = { guifg = green_light, gui = 'none' },
        TSPunctBracket = { guifg = light_medium, gui = 'none' },
        TSPunctSpecial = { guifg = green_light, gui = 'none' },
        TSRepeat = { guifg = blue, gui = 'none' },
        TSString = { guifg = green, gui = 'none' },
        TSStringRegex = { guifg = green_light, gui = 'none' },
        TSStringEscape = { guifg = green_light, gui = 'none' },
        TSSymbol = { guifg = green, gui = 'none' },
        TSTag = { guifg = blue, gui = 'none' },
        TSTagDelimiter = { guifg = light_medium, gui = 'none' },
        TSText = { guifg = dark_soft, gui = 'none' },
        TSStrong = { gui = 'bold' },
        TSEmphasis = { guifg = black, gui = 'bold' },
        TSUnderline = { guifg = black, gui = 'underline' },
        TSStrike = { guifg = black, gui = 'strikethrough' },
        TSTitle = { guifg = blue, gui = 'none' },
        TSLiteral = { guifg = green, gui = 'none' },
        TSURI = { guifg = green, gui = 'underline' },
        TSType = { guifg = purple, gui = 'none' },
        TSTypeBuiltin = { guifg = blue },
        TSVariable = { guifg = light_medium, gui = 'none' },
        TSVariableBuiltin = { guifg = blue },

        TSDefinition = { gui = 'underline', guisp = light_soft },
        TSDefinitionUsage = { gui = 'underline', guisp = light_soft },
        TSCurrentScope = { gui = 'bold' },

        NvimInternalError = { guifg = black, guibg = red, gui = 'none' },

        NormalFloat = { guifg = light_medium, guibg = black },
        FloatBorder = { guifg = light_medium, guibg = black },
        NormalNC = { guifg = light_medium, guibg = black },
        TermCursor = { guifg = black, guibg = light_medium, gui = 'none' },
        TermCursorNC = { guifg = black, guibg = light_medium },

        User1 = { guifg = red, guibg = dark_medium, gui = 'none' },
        User2 = { guifg = purple, guibg = dark_medium, gui = 'none' },
        User3 = { guifg = light_medium, guibg = dark_medium, gui = 'none' },
        User4 = { guifg = cyan, guibg = dark_medium, gui = 'none' },
        User5 = { guifg = dark_hard, guibg = dark_medium, gui = 'none' },
        User6 = { guifg = light_medium, guibg = dark_medium, gui = 'none' },
        User7 = { guifg = light_medium, guibg = dark_medium, gui = 'none' },
        User8 = { guifg = black, guibg = dark_medium, gui = 'none' },
        User9 = { guifg = black, guibg = dark_medium, gui = 'none' },

        TreesitterContext = { guibg = dark_hard },
    }

    set_colors(scheme)

    vim.g.terminal_color_0 = black
    vim.g.terminal_color_1 = red
    vim.g.terminal_color_2 = green
    vim.g.terminal_color_3 = yellow
    vim.g.terminal_color_4 = blue
    vim.g.terminal_color_5 = purple
    vim.g.terminal_color_6 = cyan
    vim.g.terminal_color_7 = light_medium
    vim.g.terminal_color_8 = dark_soft
    vim.g.terminal_color_9 = red
    vim.g.terminal_color_10 = green
    vim.g.terminal_color_11 = yellow
    vim.g.terminal_color_12 = blue
    vim.g.terminal_color_13 = purple
    vim.g.terminal_color_14 = cyan
    vim.g.terminal_color_15 = white
end

return M

