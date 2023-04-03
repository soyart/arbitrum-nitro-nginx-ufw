docker run --network host -d \
	--mount type="bind",source="$HOME/.arbitrum",target="/home/user/.arbitrum" \
	foo/arbnode;
