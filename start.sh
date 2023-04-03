# L1URL is Ethereum node URL

/usr/local/bin/nitro \
	--l1.url "$L1URL" \
	--l2.chain-id=42161 \
	--init.url="https://snapshot.arbitrum.io/mainnet/nitro.tar" \
	--http.api=net,web3,eth,debug \
	--http.corsdomain=* \
	--http.addr=0.0.0.0 \
	--http.port=6969 \
	--ws.addr=0.0.0.0 \
	--ws.port=6970 \
	--ws.api=net,web3,eth,debug;
