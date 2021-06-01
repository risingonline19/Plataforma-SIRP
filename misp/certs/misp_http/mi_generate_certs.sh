#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd $DIR

#echo "Root CA"

#openssl genrsa -out root-ca-key.pem 2048

#openssl req -days 3650 -new -x509 -sha256 -key root-ca-key.pem -out root-ca.pem -subj "/C=US/L=California/O=Company/CN=root-ca"


echo "* MISP cert"

echo "create: misp-key-temp.pem"

openssl genrsa -out misp-key-temp.pem 2048

echo "create: misp.local.key"

openssl pkcs8 -inform PEM -outform PEM -in misp-key-temp.pem -topk8 -nocrypt -v1 PBE-SHA1-3DES -out misp.local.key

echo "create: misp.local.csr"

openssl req -days 3650 -new -key misp.local.key -out misp.local.csr -subj "/C=ES/L=Barcelona/O=CyberHome Ltd/CN=misp.local"

