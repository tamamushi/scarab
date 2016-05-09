
$ADMINPASSWORD = vagrant

net user administrator /active:yes
net user administrator $ADMINPASSWORD

powershell -Command "Start-Process powershell.exe -ArgumentList 'Enable-PSRemoting -SkipNetworkProfileCheck -Force' -Verb runas"
powershell -Command "Start-Process powershell.exe -ArgumentList 'Set-ExecutionPolicy Bypass -force' -Verb runas"
powershell -Command "Start-Process powershell.exe -ArgumentList 'Start-Service -Name WinRM -PathThru' -Verb runas"
powershell -Command "Start-Process powershell.exe -ArgumentList 'Set-Service WinRM -StartupType Automatic' -Verb runas"

powershell -Command "Start-Process powershell.exe -ArgumentList open_winrm.ps1 -Verb runas"
sc config WinRM start= auto

netsh firewall set service remotedesktop enable
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Terminal Server" /v "fDenyTSConnections" /t REG_DWORD /d "0" /f

$networkListManager = [Activator]::CreateInstance([Type]::GetTypeFromCLSID([Guid]"{DCB00C01-570F-4A9B-8D69-199FDBA5723B}")) 
$connections = $networkListManager.GetNetworkConnections() 
$connections | % {$_.GetNetwork().SetCategory(1)}

winrm qc -quiet

winrm set winrm/config/client/auth @{Basic="true"}
winrm set winrm/config/service/auth '@{Basic="true"}'
winrm set winrm/config/service '@{AllowUnencrypted="true"}'

<# サービスの開始と停止
http://nasunoblog.blogspot.jp/2014/01/powershell-get-service-matome.html
#>

