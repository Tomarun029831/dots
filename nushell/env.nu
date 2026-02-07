# env.nu
#
# Installed by:
# version = "0.105.1"
#
# Previously, environment variables were typically configured in `env.nu`.
# In general, most configuration can and should be performed in `config.nu`
# or one of the autoload directories.
#
# This file is generated for backwards compatibility for now.
# It is loaded before config.nu and login.nu
#
# See https://www.nushell.sh/book/configuration.html
#
# Also see `help config env` for more options.
#
# You can remove these comments if you want or leave
# them for future reference.

$env.config.show_banner = false;
$env.config.shell_integration.osc133 = false
$env.config.buffer_editor = "nvim"

def get-git-status [] {
    let status_lines = (do { ^git status --porcelain=1 } | complete | get stdout | lines)
    let counts = ($status_lines | reduce --fold { staged: 0, modified: 0, untracked: 0, deleted: 0, renamed: 0, conflicted: 0, stashed: 0 }
    {|line, acc|
        let prefix = ($line | str substring 0..1)
        let first_char = ($prefix | str substring 0..0)
        let second_char = ($prefix | str substring 1..1)
        if ($prefix == "??") { 
            $acc | upsert untracked ($acc.untracked + 1) 
        } else if ($first_char == "U" or $second_char == "U" or $prefix == "AA" or $prefix == "DD") { 
            $acc | upsert conflicted ($acc.conflicted + 1)
        } else if ($first_char == "R") { 
            $acc | upsert renamed ($acc.renamed + 1)
        } else if ($first_char == "D" or $second_char == "D") { 
            $acc | upsert deleted ($acc.deleted + 1)
        } else if ($first_char != " " and $second_char == " ") { 
            $acc | upsert staged ($acc.staged + 1)
        } else if ($second_char == "M" or ($first_char == "M" and $second_char == "M")) { 
            $acc | upsert modified ($acc.modified + 1)
        } else { 
            $acc 
        }
    })
    return $counts
}

def create_left_prompt [] {
    let dir_display = ($env.PWD | str replace $nu.home-dir '~')
    let git_path = ("C:/Program Files/Git/cmd/git.exe" | path expand)
    let git_branch = (do { ^$git_path 'branch' '--show-current' } | complete | get stdout | str trim )
    let git_status = get-git-status
    let git_status_display = [
        (if $git_status.conflicted > 0 { $"(ansi red_bold)=($git_status.conflicted) " })
        (if $git_status.staged > 0     { $"(ansi green)+($git_status.staged) " })
        (if $git_status.renamed > 0    { $"(ansi cyan)r($git_status.renamed) " })
        (if $git_status.modified > 0   { $"(ansi yellow)!($git_status.modified) " })
        (if $git_status.deleted > 0    { $"(ansi red)x($git_status.deleted) " })
        (if $git_status.untracked > 0  { $"(ansi magenta)?($git_status.untracked) " })
        (ansi green)
    ] | compact | str join

    let git_display = if ($git_branch | is-empty) { " \u{f418} --No Branch--" } else { $" \u{f418} ($git_branch) ($git_status_display)" }

    return $"┏ ($dir_display)($git_display)\n┗"
}
def create_indicator [] {
    return "> "
}

$env.PROMPT_COMMAND = { || create_left_prompt }
$env.PROMPT_COMMAND_RIGHT = {date now | format date "%Y-%m-%d %H:%M:%S" }
$env.PROMPT_INDICATOR = { || create_indicator }

$env.config.history = {
  file_format: sqlite
  max_size: 1000
  sync_on_enter: true
  isolation: true
}
