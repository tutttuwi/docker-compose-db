# ���t�@�����X

https://github.com/dbeaver/cloudbeaver/wiki/Run-Docker-Container


## SQLServer�ڑ�

- �N���C�A���g����TLS�G���[���o��Ƃ��̑Ώ�

- SQL Server�̃T�[�o�[����TLS1���g�p���Ă���ƁA�Z�L�����e�B�̐����ŃG���[�ƂȂ邱�Ƃ�����B

```
com.microsoft.sqlserver.jdbc.SQLServerException: com.microsoft.sqlserver.jdbc.SQLServerException: �h���C�o�[�� SSL (Secure Sockets Layer) �Í����ɂ�� SQL Server �ւ̈��S�Ȑڑ����m���ł��܂���ł����B�G���[: "The server selected protocol version TLS10 is not accepted by client preferences [TLS12]"�B
```

### �Ώ�

1. Java�̏ꏊ���m�F

```
which java
```

2. java.security��ҏW

- �z�u�ꏊ�FJDK 11 �̏ꍇ /conf/security/java.security

- �ҏW�O

```
$ cat /usr/lib/jvm/java-1.8.0-openjdk-amd64/jre/lib/security/java.security

(��)
jdk.tls.disabledAlgorithms=SSLv3, TLSv1, TLSv1.1, RC4, DES, MD5withRSA, \
    DH keySize < 1024, EC keySize < 224, 3DES_EDE_CBC, anon, NULL, \
    include jdk.disabled.namedCurves
(��)
```

- �ҏW��: �uTLSv1, TLSv1.1,�v���폜����

```
$ cat /usr/lib/jvm/java-1.8.0-openjdk-amd64/jre/lib/security/java.security

(��)
jdk.tls.disabledAlgorithms=SSLv3, RC4, DES, MD5withRSA, \
    DH keySize < 1024, EC keySize < 224, 3DES_EDE_CBC, anon, NULL, \
    include jdk.disabled.namedCurves
(��)
```


