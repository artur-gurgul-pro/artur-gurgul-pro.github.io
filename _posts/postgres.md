

```config /etc/postgresql/15/main/pg_hba.conf
hostssl  all      all        0.0.0.0/0     scram-sha-256
```

```config /etc/postgresql/15/main/postgresql.conf
listen_addresses = '*' # was localhost

ssl = on
#ssl_ca_file = ''
ssl_cert_file = '/etc/ssl/certs/ssl-cert-snakeoil.pem'
#ssl_crl_file = ''
#ssl_crl_dir = ''
ssl_key_file = '/etc/ssl/private/ssl-cert-snakeoil.key'
ssl_ciphers = 'HIGH:MEDIUM:+3DES:!aNULL'
```


```sql
SET password_encryption  = 'scram-sha-256';
ALTER USER "onmenu" with password 'pass#';
ALTER USER "postgres" with password 'pass#745dxfgvnR';
SELECT rolpassword from pg_authid where rolname = 'onmenu';
```


``` sh
psql "sslmode=require host=onmenu.app dbname=onmenudb user=onmenu"
```