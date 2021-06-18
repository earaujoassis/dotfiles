#!/usr/bin/env bash

set -e

echo '> Post-brew install'

# === Maccy ===
# https://github.com/p0deje/Maccy
defaults write org.p0deje.Maccy pasteByDefault true
defaults write org.p0deje.Maccy historySize 20
defaults write org.p0deje.Maccy ignoredPasteboardTypes -array-add "com.myapp.CustomType"

echo '> Done!'
