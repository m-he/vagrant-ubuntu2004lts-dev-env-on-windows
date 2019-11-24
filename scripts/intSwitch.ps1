If ("GocoddyNATSwitch" -in (Get-VMSwitch | Select-Object -ExpandProperty Name) -eq $FALSE) {
    'Creating Internal-only switch named "GocoddyNATSwitch" on Windows Hyper-V host...'
    New-VMSwitch -SwitchName "GocoddyNATSwitch" -SwitchType Internal
}
else {
    '"GocoddyNATSwitch" for static IP configuration already exists; skipping'
}

If ("172.16.0.1" -in (Get-NetIPAddress | Select-Object -ExpandProperty IPAddress) -eq $FALSE) {
    'Registering new IP address 172.16.0.1 on Windows Hyper-V host...'

    New-NetIPAddress -IPAddress 172.16.0.1 -PrefixLength 24 -InterfaceAlias "vEthernet (GocoddyNATSwitch)"
}
else {
    '"172.16.0.1" for static IP configuration already registered; skipping'
}

If ("172.16.0.0/24" -in (Get-NetNAT | Select-Object -ExpandProperty InternalIPInterfaceAddressPrefix) -eq $FALSE) {
    'Registering new NAT adapter for 172.16.0.0/24 on Windows Hyper-V host...'

    New-NetNAT -Name "GocoddyNAT" -InternalIPInterfaceAddressPrefix 172.16.0.0/24
}
else {
    '"172.16.0.0/24" for static IP configuration already registered; skipping'
}