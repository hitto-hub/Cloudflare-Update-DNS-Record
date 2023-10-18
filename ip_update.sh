#!/bin/bash
AUTH_EMAIL="your email address"
MY_DOMEIN="subdomain(.example.com)"
ZONE_IDENTIFIER="zone_id"
IDENTIFIER="recordID"
API_TOKEN="api token"

services=(
  "https://checkip.amazonaws.com/"
  "https://ipv4.icanhazip.com/"
  "https://4.icanhazip.com/"
  "https://api.ipify.org/"
)

ip_address=""

get_ip_address() {
  local url="$1"
  ip_address=$(curl -s "$url")
}

ip_pattern="^([0-9]{1,3}\.){3}[0-9]{1,3}$"

valid_ip() {
  [[ "$ip_address" =~ $ip_pattern ]]
}

for service in "${services[@]}"; do
  get_ip_address "$service"
  if valid_ip; then
    break
  fi
done

curl --request PUT \
  --url https://api.cloudflare.com/client/v4/zones/$ZONE_IDENTIFIER/dns_records/$IDENTIFIER \
  --header 'Content-Type: application/json' \
  --header "X-Auth-Email: $AUTH_EMAIL" \
  --header "Authorization: Bearer $API_TOKEN" \
  --data '{
    "content": "'"$ip_address"'",
    "name": "'"$MY_DOMEIN"'",
    "proxied": false,
    "type": "A",
    "comment": "Domain verification record",
    "ttl": 60
}'