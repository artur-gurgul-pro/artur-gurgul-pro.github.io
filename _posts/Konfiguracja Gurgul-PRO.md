watchman

nmap -p 500,4500 vpn.gurgul.pro

nc -zv vpn.gurgul.pro 500
nc -zv vpn.gurgul.pro 4500


```bash
certbot --nginx -d pub.gurgul.pro
apt install nginx-extras

root@gurgul:/etc/nginx/htpasswd# htpasswd -c pub pub

```

```
apt install vsftpd
apt install db-util
/etc/vsftpd/virtual_users.txt
```

```virtual_users.txt
username1
password1
username2
password2
```

```bash
# veryfication of the config
vsftpd /etc/vsftpd.conf
```


```
sudo nano /etc/pam.d/vsftpd

add following 

auth required pam_userdb.so db=/etc/vsftpd/virtual_users
account required pam_userdb.so db=/etc/vsftpd/virtual_users
```

add ftp user to www-data 
```
usermod -aG ftp www-data
```

```bash
sudo mkdir /etc/vsftpd/vuser_conf

nano /etc/vsftpd/vuser_conf/username1

                         local_root=/home/ftp/username1
                         write_enable=YES

sudo mkdir -p /home/ftp/username1 
sudo chown -R ftp:ftp /home/ftp/username1
```
```
```


```bash 
sudo db_load -T -t hash -f /etc/vsftpd/virtual_users.txt /etc/vsftpd/virtual_users.db
chmod 600 /etc/vsftpd/virtual_users.db
```

```bash
adduser --disabled-login --gecos 'GitLab' git
cd /home/git
sudo -u git -H git clone https://gitlab.com/gitlab-org/gitlab-foss.git -b v17.1.1 gitlab
```



rozszerzenie do vscode sftp 


```bash
ss -tulpn | grep LISTEN

ufw status numbered
ufw delete 8

ufw allow 21
```

```bash
lsblk blkid
UUID=1234-5678 /mnt/data ext4 defaults 0 2
```


- `<file system>`: This can be the UUID, label, or device name of the partition.
- `<mount point>`: The directory where you want to mount the partition.
- `<type>`: The file system type (e.g., ext4, ntfs, vfat).
- `<options>`: Mount options (e.g., `defaults`, `noatime`, `ro`). `defaults` is a common choice for basic mounts.
- `<dump>`: This is usually set to `0`.
- `<pass>`: This determines the order in which filesystem checks are done at boot time. `1` is for the root filesystem, `2` is for other filesystems, and `0` means no check.



debootstrap bookworm /srv/chroot/zulip http://deb.debian.org/debian