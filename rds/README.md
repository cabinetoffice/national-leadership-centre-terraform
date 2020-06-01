This creates a SG and RDS instance

The initial username and password are set in the vars file or on command line and later
can be added to vault when the cluster is up.

A new user should also be created with more limited permissions to just the connect db.

```
CREATE USER 'connect'@'%' IDENTIFIED BY 'A_NEW_PASSWORD';
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, INDEX, ALTER, CREATE TEMPORARY TABLES ON connect;
```

Then save the user and password into vault

```
12:46 $ VAULT_ADDR=https://localhost:8200/ VAULT_CACERT=ca.pem vault kv put secret/service/connect @vault-kv-write.json
Key              Value
---              -----
created_time     2020-01-24T12:46:13.972557475Z
deletion_time    n/a
destroyed        false
version          3
```

Connect to the db via the drupal node

```

root@nlc-connect-6565c79c45-wt7lb:/var/www# /usr/bin/vaultenv-wrapper vendor/bin/drush sqlc
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MySQL connection id is 1189
Server version: 5.7.22-log Source distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MySQL [connect]> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| connect            |
+--------------------+
2 rows in set (0.001 sec)

MySQL [connect]>
```
