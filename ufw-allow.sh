echo "Resetting ufw firewall";

ufw reset;
ufw default deny incoming;

echo "Allowing port 22";
ufw allow 22;

# Get HOSTS variable
. ./ufw-hosts.sh

for h in ${HOSTS[@]};
do
        echo "allowing $h";
        ufw allow from "$h";
done;

echo  "Firewall set, enable with `ufw enable`";
