# config.nu
#
# Installed by:
# version = "0.105.1"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# This file is loaded after env.nu and before login.nu
#
# You can open this file in your default editor using:
# config nu
#
# See `help config nu` for more options
#
# You can remove these comments if you want or leave
# them for future reference.

# Shell
$env.config.show_banner = false;
$env.config.shell_integration.osc133 = false

# NeoVim
def v [...args] {nvim ...$args}
def create_left_prompt [] {
    let is_nvim = ($env | get -o NVIM | is-not-empty)
    if $is_nvim {
        return ""
    } else {
        let dir = (pwd | str replace $nu.home-path '~')
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

# Proxy
def hasProxyEnabled [] {
    const key = 'Software\Microsoft\Windows\CurrentVersion\Internet Settings'
    let enable = try { (registry query --hkcu $key ProxyEnable).value } catch { -1 }
    return $enable
}
def getSSID [] {
    let ssid = (netsh wlan show interfaces | lines | find -r "^ *SSID" | parse -r '.*:\s*(?P<name>.*)')
    return $ssid
}
def shouldEnableProxy [] {
    use ./.env.nu school_ssid
    let current_ssid = getSSID
    if ($current_ssid not-in $school_ssid and hasProxyEnabled == false) {return true}
    return false
}
