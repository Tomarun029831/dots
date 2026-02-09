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

def create_left_prompt [] {
    let dir_display = ($env.PWD | str replace $nu.home-dir '~')
    let git_branch_name = ( ^git 'branch' '--show-current' | complete | get stdout | str trim)
    def commit_status [] { (if ( ^git 'status' '--porcelain=1' | is-empty ) { "[ ]" } else { "[+]" } ) } # INFO: This Func is here to reach Lazy Evaluation
    let git_display = if ($git_branch_name | is-empty) { " \u{f418} --No Branch--" } else { $" \u{f418} ($git_branch_name) (commit_status)" }
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
