URL=$1;

[ -z "$URL" ] \
    && URL="http://localhost:6969";

curl $URL \
  -X POST \
  -H "Content-Type: application/json" \
  --data '{"jsonrpc":"2.0","method":"eth_syncing","params":[],"id":67}';
