# 1:enable, 0:disable, -1:error
def hasProxyEnabled [] {
    const key = 'Software\Microsoft\Windows\CurrentVersion\Internet Settings'
    let enable = try { (registry query --hkcu $key ProxyEnable).value } catch { -1 }
    return $enable
}

def getSSID [] {
    let ssid = (netsh wlan show interfaces | lines | find -r "^ *SSID" | parse -r '.*:\s*(?P<name>.*)').name.0 | ansi strip | str trim
    return $ssid
}

def isSchoolSSID [] {
    use ./.env.nu school_ssid
    let current_ssid = getSSID
    if $current_ssid in $school_ssid { return true }
    return false
}

def switchProxyActivityBySSID [] {
    let next_status = if (isSchoolSSID) { 1 } else { 0 }
    let current_status = hasProxyEnabled
    updateLog
    if $current_status == $next_status { return }
    reg.exe add 'HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings' /v ProxyEnable /t REG_DWORD /d $next_status /f
}

def updateLog [] {
    let pathToLog = ("~/.config/nushell/proxy/switchProxy.log" | path expand)
    let isExitLogFile = ($pathToLog | path exists)
    if $isExitLogFile == false {touch $pathToLog}
    $"(date now | format date '%Y-%m-%d %H:%M:%S')\n" | save $pathToLog --append
}

switchProxyActivityBySSID
