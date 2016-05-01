<!-- vim: set ts=4 expandtab: -->

## システム環境のソースコード

開発環境やテスト系等publicに晒しても問題のないインフラ系イメージ作成時に
使ったソースコードを保管しています。あくまでソースコードのみの保管場所と
して使います。
<br>
イメージ化したものはそれ専用のレポジトリなり、自分の環境内に保持するよう
にしてください。間違ってもこのレポジトリに登録したりしないように気をつけ
ましょう。

### 現在有効なソースコード

Docker 
- centos-lnmx
CentOS 6.7（Packerから独自で作成したもの）<br>
MySQL 5.7.12<br>
HHVM 3.2.0 （PHP仮想実行環境）<br>

MySQLは公式のdocker-entorypoint.shを使う為、5.7.12を使用。
5.7.6以降から、初期化がmysql_install_dbから'''mysqld --initialize'''に
変更になった。

docker-entrypoint.shを公式の最新版を利用して作成した為docker-entrypoint.shの
中で'''mysqld --initialize-insecure'''を使っている箇所が有り、MySQLのバージョン
は5.7.6以降のバージョンとした。
補足：よく考えたら5.6のバージョン使ってるMySQLのdockerイメージが有るわけ
だからそっちのdocker-entrypoint.shなら旧来のやり方なんじゃないか？と思い
確認してみたらやっぱそうだった。現時点（2016年5月1日）で、
'''mysqld --initialize-insecure'''がどの程度こなれてるのかは不明だが、
まー今後はこれがスタンダードになるはずなので、良しとする。

Vagrant


