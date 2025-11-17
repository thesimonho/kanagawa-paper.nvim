# -----------------------------------------------------------------------------
# Kanagawa Paper Canvas
# Upstream: https://github.com/thesimonho/kanagawa-paper.nvim/master/extras/nushell/kanagawa-paper-canvas.nu
# URL: https://www.nushell.sh/
# -----------------------------------------------------------------------------

export def main [] {

    return {
        binary: '#c27672'
        block: '#809ba7'
        cell-path: '#b4b4ac'
        closure: '#7e8faf'
        custom: '#b4b4ac'
        duration: '#a7956a'
        float: '#c68582'
        glob: '#b4b4ac'
        int: '#c27672'
        list: '#7e8faf'
        nothing: '#c27672'
        range: '#a7956a'
        record: '#7e8faf'
        string: '#7b958e'

        bool: {|| if $in { '#91b0bd' } else { '#a7956a' } }

        datetime: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#c27672' attr: 'b' }
            } else if $in < 6hr {
                '#c27672'
            } else if $in < 1day {
                '#a7956a'
            } else if $in < 3day {
                '#7b958e'
            } else if $in < 1wk {
                { fg: '#7b958e' attr: 'b' }
            } else if $in < 6wk {
                '#7e8faf'
            } else if $in < 52wk {
                '#809ba7'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#b4b4ac'
            } else if $e < 1mb {
                '#7e8faf'
            } else {{ fg: '#809ba7' }}
        }

        shape_and: { fg: '#c27672' attr: 'b' }
        shape_binary: { fg: '#c27672' attr: 'b' }
        shape_block: { fg: '#809ba7' attr: 'b' }
        shape_bool: '#91b0bd'
        shape_closure: { fg: '#7e8faf' attr: 'b' }
        shape_custom: '#7b958e'
        shape_datetime: { fg: '#7e8faf' attr: 'b' }
        shape_directory: '#7e8faf'
        shape_external: '#7e8faf'
        shape_external_resolved: '#91b0bd'
        shape_externalarg: { fg: '#7b958e' attr: 'b' }
        shape_filepath: '#7e8faf'
        shape_flag: { fg: '#809ba7' attr: 'b' }
        shape_float: { fg: '#c68582' attr: 'b' }
        shape_garbage: { fg: '${fg.dim}' bg: '#c27672' attr: 'b' } # Keeping red and white for garbage
        shape_glob_interpolation: { fg: '#7e8faf' attr: 'b' }
        shape_globpattern: { fg: '#7e8faf' attr: 'b' }
        shape_int: { fg: '#c27672' attr: 'b' }
        shape_internalcall: { fg: '#7e8faf' attr: 'b' }
        shape_keyword: { fg: '#c27672' attr: 'b' }
        shape_list: { fg: '#7e8faf' attr: 'b' }
        shape_literal: '#809ba7'
        shape_match_pattern: '#7b958e'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#c27672'
        shape_operator: '#a7956a'
        shape_or: { fg: '#c27672' attr: 'b' }
        shape_pipe: { fg: '#c27672' attr: 'b' }
        shape_range: { fg: '#a7956a' attr: 'b' }
        shape_raw_string: { fg: '#b4b4ac' attr: 'b' }
        shape_record: { fg: '#7e8faf' attr: 'b' }
        shape_redirection: { fg: '#c27672' attr: 'b' }
        shape_signature: { fg: '#7b958e' attr: 'b' }
        shape_string: '#7b958e'
        shape_string_interpolation: { fg: '#7e8faf' attr: 'b' }
        shape_table: { fg: '#809ba7' attr: 'b' }
        shape_vardecl: { fg: '#809ba7' attr: 'u' }
        shape_variable: '#c27672'

        foreground: '#73787d'
        background: '#e1e1de'
        cursor: '#7e8faf'

        empty: '#809ba7'
        header: { fg: '#7b958e' attr: 'b' }
        hints: '#b4b4ac'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#7b958e' attr: 'b' }
        search_result: { fg: '#c27672' bg: '#b4b4ac' }
        separator: '#b4b4ac'
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
  