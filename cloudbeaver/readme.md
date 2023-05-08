# リファレンス

https://github.com/dbeaver/cloudbeaver/wiki/Run-Docker-Container


## SQLServer接続

- クライアント側でTLSエラーが出るときの対処

- SQL Serverのサーバー側がTLS1を使用していると、セキュリティの制限でエラーとなることがある。

```
com.microsoft.sqlserver.jdbc.SQLServerException: com.microsoft.sqlserver.jdbc.SQLServerException: ドライバーが SSL (Secure Sockets Layer) 暗号化による SQL Server への安全な接続を確立できませんでした。エラー: "The server selected protocol version TLS10 is not accepted by client preferences [TLS12]"。
```

### 対処

1. Javaの場所を確認

```
which java
```

2. java.securityを編集

- 配置場所：JDK 11 の場合 /conf/security/java.security

- 編集前

```
$ cat /usr/lib/jvm/java-1.8.0-openjdk-amd64/jre/lib/security/java.security

(略)
jdk.tls.disabledAlgorithms=SSLv3, TLSv1, TLSv1.1, RC4, DES, MD5withRSA, \
    DH keySize < 1024, EC keySize < 224, 3DES_EDE_CBC, anon, NULL, \
    include jdk.disabled.namedCurves
(略)
```

- 編集後: 「TLSv1, TLSv1.1,」を削除する

```
$ cat /usr/lib/jvm/java-1.8.0-openjdk-amd64/jre/lib/security/java.security

(略)
jdk.tls.disabledAlgorithms=SSLv3, RC4, DES, MD5withRSA, \
    DH keySize < 1024, EC keySize < 224, 3DES_EDE_CBC, anon, NULL, \
    include jdk.disabled.namedCurves
(略)
```


