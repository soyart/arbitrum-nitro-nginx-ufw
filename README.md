# arbitrum-nitro

## No `docker-compose`

I used to run Arbitrum Nitro Node via `docker-compose`, a huge mistake.

Due to Docker shenanigans, any `docker-compose` port publishing is binded to default gateway `0.0.0.0`.

This bypasses `ufw` rules, and to set firewall up requires tedious `iptables` config.

## Steps

- Customize `start.sh`, `Dockerfile`, `ufw-hosts.sh` to your needs.

- Build your image:
```sh
docker build -t foo/arbnode .
```

- Run your image:
```sh
./docker-start.sh
```

- Check if the Docker node works (we assume that `start.sh` specifies `--http.port=6969`):

```sh
./check_conn.sh http://localhost:6969;
```

- Configure and start NGINX
```sh
cp arb_nitro_proxy /etc/nginx/sites-available;
ln -s /etc/nginx/sites-available/arb_nitro_proxy /etc/nginx/sites-enabled/arb_nitro_proxy;

systemctl restart nginx;
```

- Check if NGINX reverse proxy works
```sh
./check_conn.sh http://localhost:8547; # Check on loopback
./check_conn.sh ${public_ip}:8547 # Check on public interface
```

- Enable firewall
```sh
./ufw-allow.sh;
ufw enable;
```