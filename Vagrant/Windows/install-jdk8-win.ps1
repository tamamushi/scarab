
$client = new-object System.Net.WebClient
$client.DownloadFile("https://s3-ap-northeast-1.amazonaws.com/opendoc/jdk-8u91-windows-i586.exe", "C:\\Users\\IEUser\\Downloads\\jdk.exe")

# /langは言語コード、 /sでサイレントモードで実行
C:\Users\IEUser\Downloads\jdk.exe /s /lang=1041 
