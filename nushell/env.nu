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

# INFO: Shell
$env.config.show_banner = false;
$env.config.shell_integration.osc133 = false

# INFO: NeoVim
$env.config.buffer_editor = "nvim"
def create_left_prompt [] {
    let is_nvim = ($env | get -o NVIM | is-not-empty)
    if $is_nvim {
        return ""
    } else {
        let dir = (pwd | str replace $nu.home-dir '~')
        return $"($dir)"
    }
}
def create_indicator [] {
    return "> "
    # let is_nvim = ($env | get -o NVIM | is-not-empty)
    # if $is_nvim {
    #     return "> "
    # } else {
    #     return "> "
    # }
}
$env.PROMPT_COMMAND = { || create_left_prompt }
$env.PROMPT_INDICATOR = { || create_indicator }

$env.config.history = {
  file_format: sqlite
  max_size: 1000
  sync_on_enter: true
  isolation: true
}
