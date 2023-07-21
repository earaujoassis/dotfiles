#!/usr/bin/env bash

set -e

echo '> Enter secret-key path to import: '
read $secret_path

gpg --import $secret_path

echo '> Enter public-key path to import: '
read $public_path

gpg --import $public_path

echo '> Done!'
