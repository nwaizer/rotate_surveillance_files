# How to install on entware
```shell
opkg install cron
```

then:
```shell
# cp main.sh /opt/etc/cron.5mins/rotate_surveillance_files.sh
```
# How to define max size?
Set the MAX_DIR_KB_SIZE in the file.
I choose 5GB -> 5*1000*1000 KB