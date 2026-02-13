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

# INFO: check performance
# for $it in [$env.PROMPT_COMMAND, $env.PROMPT_COMMAND_RIGHT] {print $"====== AVERAGE FOR: ($it) ======"; let durations = (1..100 | each { timeit { do $it } }); print ($durations | math avg)}
# example result:
# ====== AVERAGE FOR: closure_356 ======
# 37ms 872µs 416ns
# ====== AVERAGE FOR: closure_358 ======
# 8µs 975ns
def create_left_prompt [] {
    let dir_display = $env.PWD | str replace $nu.home-dir '~'
    let git_branch_info = ^git 'status' '--porcelain' '-b' | complete
    let git_display = if $git_branch_info.exit_code == 0 {
        let git_branch_stdouts = $git_branch_info.stdout | lines
        $"($git_branch_stdouts.0 | str substring 3..(($git_branch_stdouts.0 | str index-of '.') - 1)) (if ($git_branch_stdouts | length) > 1 {"[+]"} else {"[ ]"})"
    } else {"--No Branch--"}
    return $"┏ ($dir_display) \u{f418} ($git_display)\n┗"
}
$env.PROMPT_COMMAND = { create_left_prompt }
$env.PROMPT_COMMAND_RIGHT = {date now | format date "%Y-%m-%d %H:%M:%S" }

$env.config.history = {
  file_format: sqlite
  max_size: 1000
  sync_on_enter: true
  isolation: true
}
