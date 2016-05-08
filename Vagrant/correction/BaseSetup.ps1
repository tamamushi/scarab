
$SET_IP = "192.168.1.118"
$GW_IP  = "192.168.1.1"

winrm qc -quiet

$networkListManager = [Activator]::CreateInstance([Type]::GetTypeFromCLSID([Guid]"{DCB00C01-570F-4A9B-8D69-199FDBA5723B}")) 
$connections = $networkListManager.GetNetworkConnections() 
$connections | % {$_.GetNetwork().SetCategory(1)}

winrm set winrm/config/client/auth @{Basic="true"}
winrm set winrm/config/service/auth '@{Basic="true"}'
winrm set winrm/config/service '@{AllowUnencrypted="true"}'

## Network Setting
$IP_info = netsh interface ipv4 show config `
        name="Local Area Connection 4" `
      | Out-String -Stream `
      | Select-String -Pattern "IP Address:" `
      | %{($_ -split ": +")[-1]}

netsh interface ipv4 delete address name="Local Area Connection 4" addr=$IP_info gateway=all
netsh interface ipv4 set address "Local Area Connection 4" static $SET_IP 255.255.255.0
netsh interface ip add address name="Local Area Connection 4" gateway=$GW_IP gwmetric=1

<# サービスの開始と停止
http://nasunoblog.blogspot.jp/2014/01/powershell-get-service-matome.html

IPアドレスの取得
http://mtgpowershell.blogspot.jp/2011/06/ip.html
http://mtgpowershell.blogspot.jp/2011/03/filter.html

IPアドレス設定（netsh)
http://www.atmarkit.co.jp/ait/articles/1002/05/news097.html
http://teruteru.xsrv.jp/wp/blog/2015/02/19/%E3%83%87%E3%83%95%E3%82%A9%E3%83%AB%E3%83%88%E3%82%B2%E3%83%BC%E3%83%88%E3%82%A6%E3%82%A7%E3%82%A4%E3%82%92netsh%E3%81%A7%E5%A4%89%E6%9B%B4%E3%81%97%E3%81%9F%E3%81%84%E3%81%91%E3%81%A9%E3%83%BB/
#>

