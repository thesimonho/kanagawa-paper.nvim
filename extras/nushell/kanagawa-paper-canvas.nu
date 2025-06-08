# -----------------------------------------------------------------------------
# Kanagawa Paper Canvas
# Upstream: https://github.com/thesimonho/kanagawa-paper.nvim/master/extras/nushell/kanagawa-paper-canvas.nu
# URL: https://www.nushell.sh/
# -----------------------------------------------------------------------------

export def main [] {

    return {
        binary: '#b35560'
        block: '#719ac2'
        cell-path: '#858479'
        closure: '#526c79'
        custom: '#858479'
        duration: '#a67337'
        float: '#c75f6b'
        glob: '#858479'
        int: '#b35560'
        list: '#526c79'
        nothing: '#b35560'
        range: '#a67337'
        record: '#526c79'
        string: '#57786c'

        bool: {|| if $in { '#86aed7' } else { '#a67337' } }

        datetime: {|| (date now) - $in |
            if $in < 1hr {
                { fg: '#b35560' attr: 'b' }
            } else if $in < 6hr {
                '#b35560'
            } else if $in < 1day {
                '#a67337'
            } else if $in < 3day {
                '#57786c'
            } else if $in < 1wk {
                { fg: '#57786c' attr: 'b' }
            } else if $in < 6wk {
                '#526c79'
            } else if $in < 52wk {
                '#719ac2'
            } else { 'dark_gray' }
        }

        filesize: {|e|
            if $e == 0b {
                '#858479'
            } else if $e < 1mb {
                '#526c79'
            } else {{ fg: '#719ac2' }}
        }

        shape_and: { fg: '#b35560' attr: 'b' }
        shape_binary: { fg: '#b35560' attr: 'b' }
        shape_block: { fg: '#719ac2' attr: 'b' }
        shape_bool: '#86aed7'
        shape_closure: { fg: '#526c79' attr: 'b' }
        shape_custom: '#57786c'
        shape_datetime: { fg: '#526c79' attr: 'b' }
        shape_directory: '#526c79'
        shape_external: '#526c79'
        shape_external_resolved: '#86aed7'
        shape_externalarg: { fg: '#57786c' attr: 'b' }
        shape_filepath: '#526c79'
        shape_flag: { fg: '#719ac2' attr: 'b' }
        shape_float: { fg: '#c75f6b' attr: 'b' }
        shape_garbage: { fg: '${fg.dim}' bg: '#c75758' attr: 'b' } # Keeping red and white for garbage
        shape_glob_interpolation: { fg: '#526c79' attr: 'b' }
        shape_globpattern: { fg: '#526c79' attr: 'b' }
        shape_int: { fg: '#b35560' attr: 'b' }
        shape_internalcall: { fg: '#526c79' attr: 'b' }
        shape_keyword: { fg: '#b35560' attr: 'b' }
        shape_list: { fg: '#526c79' attr: 'b' }
        shape_literal: '#719ac2'
        shape_match_pattern: '#57786c'
        shape_matching_brackets: { attr: 'u' }
        shape_nothing: '#b35560'
        shape_operator: '#a67337'
        shape_or: { fg: '#b35560' attr: 'b' }
        shape_pipe: { fg: '#b35560' attr: 'b' }
        shape_range: { fg: '#a67337' attr: 'b' }
        shape_raw_string: { fg: '#858479' attr: 'b' }
        shape_record: { fg: '#526c79' attr: 'b' }
        shape_redirection: { fg: '#b35560' attr: 'b' }
        shape_signature: { fg: '#57786c' attr: 'b' }
        shape_string: '#57786c'
        shape_string_interpolation: { fg: '#526c79' attr: 'b' }
        shape_table: { fg: '#719ac2' attr: 'b' }
        shape_vardecl: { fg: '#719ac2' attr: 'u' }
        shape_variable: '#b35560'

        foreground: '#595b62'
        background: '#e1e1de'
        cursor: '#618bb6'

        empty: '#719ac2'
        header: { fg: '#57786c' attr: 'b' }
        hints: '#a9a8a0'
        leading_trailing_space_bg: { attr: 'n' }
        row_index: { fg: '#57786c' attr: 'b' }
        search_result: { fg: '#b35560' bg: '#858479' }
        separator: '#858479'
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
  