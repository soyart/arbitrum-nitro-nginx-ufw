# arbitrum-nitro-nginx-ufw

## No `docker-compose`

I used to run Arbitrum Nitro Node via `docker-compose`, a huge mistake.

Due to Docker shenanigans, any `docker-compose` port publishing is binded to default gateway `0.0.0.0`.

This bypasses `ufw` rules, and to set firewall up requires tedious `iptables` config.

## Steps

1. Customize [`start.sh`](./start.sh), [`Dockerfile`](./Dockerfile), [`ufw-hosts.sh`](./ufw-hosts.sh), and [`ufw-allow.sh`](./ufw-allow.sh) to your needs.

2. Build your image:
```sh
docker build -t foo/arbnode .
```

3. Run your image:
```sh
./docker-start.sh
```

4. Check if the Docker node works (we assume that `start.sh` specifies `--http.port=6969`):

```sh
./check_conn.sh http://localhost:6969;
```

5. Configure and start NGINX
```sh
cp arb_nitro_proxy /etc/nginx/sites-available;
ln -s /etc/nginx/sites-available/arb_nitro_proxy /etc/nginx/sites-enabled/arb_nitro_proxy;

systemctl restart nginx;
```

6. Check if NGINX reverse proxy works
```sh
./check_conn.sh http://localhost:8547; # Check on loopback
./check_conn.sh ${public_ip}:8547 # Check on public interface
```

7. Enable firewall
```sh
./ufw-allow.sh;
ufw enable;
```