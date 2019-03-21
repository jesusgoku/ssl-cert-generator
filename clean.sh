#!/usr/bin/env sh

find ./output -type f \
  \( -name "*.key" -o \
  -name "*.crt" -o \
  -name "*.srl" -o \
  -name "*.ext" -o \
  -name "*.cnf" -o \
  -name "*.csr" -o \
  -name "*.p12" -o \
  -name "*.pem" \) \
  -delete
