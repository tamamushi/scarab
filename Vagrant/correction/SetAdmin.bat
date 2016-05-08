
$ADMINPASSWORD = vagrant

net user administrator /active:yes
net user administrator $ADMINPASSWORD

powershell -Command "Start-Process powershell.exe -ArgumentList Enable-PSRemoting -Verb runas"
powershell -Command "Start-Process powershell.exe -ArgumentList 'Set-ExecutionPolicy Bypass -force' -Verb runas"
powershell -Command "Start-Process powershell.exe -ArgumentList 'Start-Service -Name WinRM -PathThru' -Verb runas"
powershell -Command "Start-Process powershell.exe -ArgumentList 'Set-Service WinRM -StartupType Automatic' -Verb runas"

powershell -Command "Start-Process powershell.exe -ArgumentList BaseSetup.ps1 -Verb runas"


