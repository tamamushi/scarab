
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

