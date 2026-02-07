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
    let git_path = ("C:/Program Files/Git/cmd/git.exe" | path expand)
    let gitbranch = (do { ^$git_path 'branch' '--show-current' } | complete | get stdout | str trim)
    let git_display = if ($gitbranch | is-empty) { " \u{f418} --No Branch--" } else { $" \u{f418} ($gitbranch)" }

    return $"|- ($dir_display)($git_display)\n|"
}
def create_indicator [] {
    return "-> "
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
