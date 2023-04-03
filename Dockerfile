FROM offchainlabs/nitro-node:v2.0.12-alpha.6-2436da3-slim

WORKDIR /app
COPY start.sh ./

ENTRYPOINT /app/start.sh
