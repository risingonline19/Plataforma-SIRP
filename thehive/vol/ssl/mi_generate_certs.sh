#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd $DIR

#echo "Root CA"

#openssl genrsa -out root-ca-key.pem 2048

#openssl req -days 3650 -new -x509 -sha256 -key root-ca-key.pem -out root-ca.pem -subj "/C=US/L=California/O=Company/CN=root-ca"


echo "* Create thehive/cortex/praeco cert"

echo "create: nginx-key-temp.pem"

openssl genrsa -out nginx-key-temp.pem 2048

echo "create: nginx.key"

openssl pkcs8 -inform PEM -outform PEM -in nginx-key-temp.pem -topk8 -nocrypt -v1 PBE-SHA1-3DES -out nginx.key

echo "create: nginx.csr"

openssl req -days 3650 -new -key nginx.key -out nginx.csr -subj "/C=ES/L=Barcelona/O=CyberHome Ltd/CN=thehive.cyberhome.es"

