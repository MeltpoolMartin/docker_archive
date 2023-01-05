## NFS share setup

Create mount point on client side
``` bash
sudo mkdir -p /nfs/paperless
```

Mount NFS to mount point
```bash
sudo mount 192.168.1.50:/volume1/docker/paperless-ngx /nfs/paperless
```

Verify successful mounting
```bash
df -h
```

## Backup data

Creating tarballs
``` bash
 docker run --rm -v paperless-ngx_paperless-db:/volume -v $(pwd):/backup busybox   tar czf /backup/paperless-ngx_db_$(date +%F_%H-%M-%S).tar.gz -C /volume .
```

``` bash
 docker run --rm -v paperless-ngx_data:/volume -v $(pwd):/backup busybox   tar czf /backup/paperless-ngx_data_$(date +%F_%H-%M-%S).tar.gz -C /volume .
```

Sending tarballs to backup server

``` bash
rsync -avz --progress paperless-ngx_db*.tar.gz nas:/volume1/docker/backup/paperless-ngx/
```

``` bash
rsync -avz --progress paperless-ngx_data_*.tar.gz nas:/volume1/docker/backup/paperless-ngx/
```
