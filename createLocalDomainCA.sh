#!/usr/bin/env sh

# Step 3: Generating SSL Certificate for localhost

if [ -z "$1" ]; then
  DOMAIN="localhost"
else
  DOMAIN="$1"
fi

# Create CSR config file
cat <<EOF > ./output/localdomain.v3.ext
authorityKeyIdentifier=keyid,issuer
basicConstraints=CA:FALSE
keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment
subjectAltName = @alt_names

[alt_names]
DNS.1 = ${DOMAIN}

EOF

# Generate certificate
openssl x509 -req -in ./output/localdomain.csr -CA ./output/cacert.pem -CAkey ./output/rootca.insecure.key -CAserial ./output/localdomain.srl -CAcreateserial -out ./output/localdomain.crt -days 500 -sha256 -extfile ./output/localdomain.v3.ext

# Generate PKCS12 (Cert + Key)
# openssl pkcs12 -export -in ./output/localdomain.crt -inkey ./output/localdomain.insecure.key -certfile ./output/cacert.pem -out ./output/localdomain.p12 -name "Certificate for ${DOMAIN}" -password pass:
