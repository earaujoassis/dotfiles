#!/usr/bin/env bash

set -e

echo '> These are the secret-keys available to export:'

gpg --list-secret-keys

echo '> Enter secret-key id to export: '
read secret_key_id

if ! [ `gpg --list-secret-keys --with-colons --with-fingerprint | awk -F: '/^fpr:/ { print $10 }' | grep "$secret_key_id"` ]
then
    echo '> Error: invalid secret-key id; exiting'
    exit
fi

rm -f ~/Downloads/key-public.gpg
rm -f ~/Downloads/key-secret.asc

gpg --output ~/Downloads/key-public.gpg --export $secret_key_id && \
gpg --output - --export-secret-key $secret_key_id |\
cat ~/Downloads/key-public.gpg - |\
gpg --armor --output ~/Downloads/key-secret.asc --symmetric --cipher-algo AES256

echo '> Key-pair exported to ~/Downloads/key-public.gpg and ~/Downloads/key-secret.asc'
