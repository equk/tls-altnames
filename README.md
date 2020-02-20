# :lock: tls-altnames

List `Subject Alternative Name` from TLS Certificates for `osint`.

## Features

- [x] Extract Subdomains from HTTPS Websites
- [x] Extract Subdomains from SMTP Mailservers

More information can be found on blog post: [Finding Subdomains From TLS](https://equk.co.uk/2017/01/20/finding-subdomains-from-tls)

## Usage Example

```sh
./https_altnames.sh example.com
[+] Getting TLS over HTTPS for  [  example.com  ]
[+] Checking for Subject Alt Names

example.com
www.example.com
mail.example.com
dev.example.com
smtp.example.com
hidden.example.com
```

## Interesting Fields

If you work with TLS certificates you will know they contain a lot of information and have various sections & fields.

One interesting field is `Subject Alternative Name` which can provide all subdomains that can use the certificate. *(unless the company uses a wildcard certificate)*

```
Certificate:
    Data:
        X509v3 extensions:
            X509v3 Subject Alternative Name:
```

This is the main field the script will try to extract.

# Contact

Website: https://equk.co.uk

Twitter: [@equilibriumuk](https://twitter.com/equilibriumuk)