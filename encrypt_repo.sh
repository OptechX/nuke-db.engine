#!/bin/sh

# find all files to encrypt
toEncrypt=`find . -name "*.ps1"`

# iterate each file and encrypt using gpg
for file in ${toEncrypt[@]}
do
  # file to target
  f="$file"

  # output file
  g="$f.gpg"

  # remove exising gpg file if found
  if [ -f "$g" ]; then
    rm -rf "$g"
  fi

  # encrypt the file
  gpg --passphrase="$LARGE_SECRET_PASSPHRASE" --pinentry-mode loopback --symmetric --cipher-algo AES256 "$f"

  # remove old file
  if [ -f "$g" ]; then
    rm -f $f
  fi
done
