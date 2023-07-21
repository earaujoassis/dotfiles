#!/usr/bin/env bash

set -e

echo '> Enter public-key path to import: '
read public_path

gpg --import $public_path

echo '> Enter secret-key path to import: '
read secret_path

gpg --output - "$secret_path" | gpg --import

echo '> Done!'
