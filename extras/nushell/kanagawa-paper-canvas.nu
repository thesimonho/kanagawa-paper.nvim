# -----------------------------------------------------------------------------
# Kanagawa Paper Canvas
# Upstream: https://github.com/thesimonho/kanagawa-paper.nvim/master/extras/nushell/kanagawa-paper-canvas.nu
# URL: https://www.nushell.sh/
# -----------------------------------------------------------------------------

export def main [] {

    return {
        binary: '#c58c89'
        block: '#91acb8'
        cell-path: '#b7b7a9'
        closure: '#929fb9'
        custom: '#b7b7a9'
        duration: '#b9a679'
        float: '#c99895'
        glob: '#b7b7a9'
        int: '#c58c89'
        list: '#929fb9'
        nothing: '#c58c89'
        range: '#b9a679'
        record: '#929fb9'
        string: '#8ba59e'

        bool: {|| if $in { '#a0bdca' } else { '#b9a679' } }

        datetime: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#c58c89' attr: 'b' }
            } else if $in < 6hr {
                '#c58c89'
            } else if $in < 1day {
                '#b9a679'
            } else if $in < 3day {
                '#8ba59e'
            } else if $in < 1wk {
                { fg: '#8ba59e' attr: 'b' }
            } else if $in < 6wk {
                '#929fb9'
            } else if $in < 52wk {
                '#91acb8'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#b7b7a9'
            } else if $e < 1mb {
                '#929fb9'
            } else {{ fg: '#91acb8' }}
        }

        shape_and: { fg: '#c58c89' attr: 'b' }
        shape_binary: { fg: '#c58c89' attr: 'b' }
        shape_block: { fg: '#91acb8' attr: 'b' }
        shape_bool: '#a0bdca'
        shape_closure: { fg: '#929fb9' attr: 'b' }
        shape_custom: '#8ba59e'
        shape_datetime: { fg: '#929fb9' attr: 'b' }
        shape_directory: '#929fb9'
        shape_external: '#929fb9'
        shape_external_resolved: '#a0bdca'
        shape_externalarg: { fg: '#8ba59e' attr: 'b' }
        shape_filepath: '#929fb9'
        shape_flag: { fg: '#91acb8' attr: 'b' }
        shape_float: { fg: '#c99895' attr: 'b' }
        shape_garbage: { fg: '${fg.dim}' bg: '#c58c89' attr: 'b' } # Keeping red and white for garbage
        shape_glob_interpolation: { fg: '#929fb9' attr: 'b' }
        shape_globpattern: { fg: '#929fb9' attr: 'b' }
        shape_int: { fg: '#c58c89' attr: 'b' }
        shape_internalcall: { fg: '#929fb9' attr: 'b' }
        shape_keyword: { fg: '#c58c89' attr: 'b' }
        shape_list: { fg: '#929fb9' attr: 'b' }
        shape_literal: '#91acb8'
        shape_match_pattern: '#8ba59e'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#c58c89'
        shape_operator: '#b9a679'
        shape_or: { fg: '#c58c89' attr: 'b' }
        shape_pipe: { fg: '#c58c89' attr: 'b' }
        shape_range: { fg: '#b9a679' attr: 'b' }
        shape_raw_string: { fg: '#b7b7a9' attr: 'b' }
        shape_record: { fg: '#929fb9' attr: 'b' }
        shape_redirection: { fg: '#c58c89' attr: 'b' }
        shape_signature: { fg: '#8ba59e' attr: 'b' }
        shape_string: '#8ba59e'
        shape_string_interpolation: { fg: '#929fb9' attr: 'b' }
        shape_table: { fg: '#91acb8' attr: 'b' }
        shape_vardecl: { fg: '#91acb8' attr: 'u' }
        shape_variable: '#c58c89'

        foreground: '#84908e'
        background: '#e1e1de'
        cursor: '#929fb9'

        empty: '#91acb8'
        header: { fg: '#8ba59e' attr: 'b' }
        hints: '#b7b7a9'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#8ba59e' attr: 'b' }
        search_result: { fg: '#c58c89' bg: '#b7b7a9' }
        separator: '#b7b7a9'
    }
}

# Update the Nushell configuration
export def --env "set color_config" [] {
    $env.config.color_config = (main)
}

# Update terminal colors
export def "update terminal" [] {
    let theme = (main)

    # Set terminal colors
    let osc_screen_foreground_color = '10;'
    let osc_screen_background_color = '11;'
    let osc_cursor_color = '12;'
        
    $"
    (ansi -o $osc_screen_foreground_color)($theme.foreground)(char bel)
    (ansi -o $osc_screen_background_color)($theme.background)(char bel)
    (ansi -o $osc_cursor_color)($theme.cursor)(char bel)
    "
    # Line breaks above are just for source readability
    # but create extra whitespace when activating. Collapse
    # to one line and print with no-newline
    | str replace --all "\n" ''
    | print -n $"($in)\r"
}

export module activate {
    export-env {
        set color_config
        update terminal
    }
}

# Activate the theme when sourced
use activate
  