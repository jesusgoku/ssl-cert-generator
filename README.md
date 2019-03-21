# SSL Cert Generator

Generate SSL Certificates for developoment time.

## Running

### Running all

```sh
./createAll.sh [domain]
```

### Running step by step

```
./createRootCA.sh [domain]
./createLocalDomainCSR.sh [domain]
./createLocalDomainCA.sh [domain]
```

## Usage

Use the following files in your application:

- `output/localdomain.crt`
- `output/localdomain.insecure.key`

Use the following files in your browser as CA Authority:

- `output/cacert.pem`

## References

- https://blog.atulr.com/localhost-https/
- https://alexanderzeitler.com/articles/Fixing-Chrome-missing_subjectAltName-selfsigned-cert-openssl/
