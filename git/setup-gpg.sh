#!/usr/bin/env bash

set -e

echo '> Setup git and gpg'

if [ "$(which gpg)" == "" ]
then
    echo '> gpg is not available; have you bootstraped the project already?'
    exit
fi

if [ "$(gpg --list-secret-keys --with-colons --with-fingerprint | awk -F: '/^fpr:/ { print $10 }')" == "" ]
then
    echo '> Error: no secret key available in gpg; exiting'
    exit
fi

if [ "$KEY" == "" ]
then
    echo '> Error: you must define a $KEY value; exiting'
    exit
fi

if ! [ `gpg --list-secret-keys --with-colons --with-fingerprint | awk -F: '/^fpr:/ { print $10 }' | grep "$KEY"` ]
then
    echo '> Error: the provided $KEY is not available in gpg; exiting'
    exit
fi

git config --global user.signingkey ${KEY}
git config --global commit.gpgsign true

echo '> Done!'
