#!/usr/bin/env sh

# Step 2: Creating a Certificate Signing Request

if [ -z "$1" ]; then
  DOMAIN="localhost"
else
  DOMAIN="$1"
fi

# Create CSR config file
cat <<EOF > ./output/localdomain.csr.cnf
[req]
default_bits = 2048
prompt = no
default_md = sha256
distinguished_name = dn

[dn]
C=IN
ST=SomeState
L=SomeCity
O=SomeOrganization
OU=SomeUnit
emailAddress=test@test.com
CN = ${DOMAIN}

EOF

# Creating the private/public key pair
# openssl genrsa -des3 -out ./output/localdomain.secure.key 2048

# Remove the password protection
# openssl rsa -in  ./output/localdomain.secure.key -out ./output/localdomain.insecure.key

# Creating a Certificate Signing Request
# openssl req -new -sha256 -nodes -out ./output/localdomain.csr -key ./output/localdomain.insecure.key -config ./output/localdomain.csr.cnf
openssl req -new -sha256 -nodes -out ./output/localdomain.csr -keyout ./output/localdomain.insecure.key -config ./output/localdomain.csr.cnf
