# 1:enable, 0:disable, -1:error
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
    if $current_ssid in $school_ssid and (hasProxyEnabled) == 0 { return true }
    return false
}
def switchProxyActivityBySSID [] {
    let next_status = if (shouldEnableProxy) { 1 } else { 0 }
    let current_status = hasProxyEnabled
    updateLog
    if $current_status == $next_status { return }
    reg.exe add 'HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings' /v ProxyEnable /t REG_DWORD /d $next_status /f
}
def updateLog [] {
    let pathToLog = ("~/.config/nushell/proxy/switchProxy.log" | path expand)
    let isExitLogFile = ($pathToLog | path exists)
    print $isExitLogFile
    if $isExitLogFile == false {touch $pathToLog}
    $"(date now | format date '%Y-%m-%d %H:%M:%S')\n" | save $pathToLog --append
}

switchProxyActivityBySSID
