# Cloudflare Update DNS Record

This script updates a Cloudflare DNS record with the current public IP address of the machine it is running on.

## Installation

1. Clone the repository: `git clone https://github.com/hitto-hub/Cloudflare-Update-DNS-Record.git`

## Usage

1. Set Variables
    - `AUTH_EMAIL`: The email address of your Cloudflare account
    - `MY_DOMEIN`: The (sub)domain name you want to update
    - `ZONE_IDENTIFIER`: Scroll to the bottom of the "Overview" page and you will find the Zone ID in the "API" section on the right.
    - `IDENTIFIER`: [document](https://developers.cloudflare.com/api/operations/dns-records-for-a-zone-list-dns-records) "zone_id" in "result" of response is "IDENTIFIER".
    By the way, the Global API Key is [here](https://dash.cloudflare.com/profile/api-tokens).
    - `API_TOKEN`: Create token [here](https://dash.cloudflare.com/profile/api-tokens).Select "Edit zone DNS" template. Then set the following and press continue to summary to continue.Token will be displayed.

    > Permissions
    > - Zone - DNS - Edit
    > - Zone - Zone - Read
    >
    > Zone Resources
    > - Include - Specific zone - "your domain"
2. Crontab Setting
    - `chmod +x update_dns_record.sh`
    - `crontab -e`
    - `*/15 * * * * /path/to/Cloudflare-Update-DNS-Record/update_dns_record.sh > /var/log/ip_update.log 2>&1`

## Documentation

- [Cloudflare API Documentation](https://api.cloudflare.com/)
- [Cloudflare API Update DNS Record](https://developers.cloudflare.com/api/operations/dns-records-for-a-zone-update-dns-record)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Author

- Name: hitto
- GitHub: [hitto-hub](https://github.com/hitto-hub)

This README.md was largely created by GitHub Copilot.
