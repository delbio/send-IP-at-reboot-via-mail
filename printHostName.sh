_IP=$(hostname -I) || true
if [ "$_IP" ]; then
	printf "My IP address is %s\n" "$_IP"
fi
