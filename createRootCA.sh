#/usr/bin/env sh

# Step 1: Generating Root SSL Certificate (CA Certificate)

if [ -z "$1" ]; then
  DOMAIN="localhost"
else
  DOMAIN="$1"
fi

# Create CSR config file
cat <<EOF > ./output/rootca.csr.cnf
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
# openssl genrsa -des3 -out ./output/rootca.secure.key 2048 -password pass:1234

# Remove password protection
# openssl rsa -in  ./output/rootca.secure.key -out ./output/rootca.insecure.key

# Generating Root SSL Certificate (CA Certificate)
# openssl req -new -x509 -nodes -key ./output/rootca.insecure.key -sha256 -out ./output/cacert.pem -days 3650 -config ./output/rootca.csr.cnf
openssl req -new -x509 -nodes -keyout ./output/rootca.insecure.key -sha256 -out ./output/cacert.pem -days 3650 -config ./output/rootca.csr.cnf
