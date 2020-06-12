#!/usr/bin/env bash

set -e

# Setup macOS settings. This is inspired by the following repos:
#
# - https://github.com/rootbeersoup/dotfiles
# - https://github.com/skwp/dotfiles
# - https://github.com/sobolevn/dotfiles
#

echo 'Setup macOS settings'
osascript -e 'tell application "System Preferences" to quit'

# Battery: hide time; display percentage
defaults write com.apple.menuextra.battery ShowPercent -string "YES"
defaults write com.apple.menuextra.battery ShowTime -string "NO"

# Scrollbars: display when scrolling:
defaults write NSGlobalDomain AppleShowScrollBars -string "WhenScrolling"

# Always use expanded save dialog:
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Maximize windows on double clicking them:
defaults write -g AppleActionOnDoubleClick 'Maximize'

# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Show indicator lights for open apps in Dock:
defaults write com.apple.dock show-process-indicators -bool true

# Dock size and location:
defaults write com.apple.Dock size-immutable -bool yes

# Dock is always visible:
defaults write com.apple.dock autohide -bool false

# Show Finder path bar:
defaults write com.apple.finder ShowPathbar -bool true

# Do not show status bar in Finder:
defaults write com.apple.finder ShowStatusBar -bool false

# Show hidden files in Finder:
defaults write com.apple.finder AppleShowAllFiles -bool true

# Show file extensions in Finder:
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Allow text selection in Quick Look
defaults write com.apple.finder QLEnableTextSelection -bool true

# Display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Disable warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Show Library folder
chflags nohidden ~/Library

# Privacy: don’t send search queries to Apple
defaults write com.apple.Safari UniversalSearchEnabled -bool false
defaults write com.apple.Safari SuppressSearchSuggestions -bool true

# Improve Safari security
defaults write com.apple.Safari \
  com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaEnabled \
  -bool false
defaults write com.apple.Safari \
  com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaEnabledForLocalFiles \
  -bool false

# === Maccy ===
# https://github.com/p0deje/Maccy
defaults write org.p0deje.Maccy pasteByDefault true
defaults write org.p0deje.Maccy historySize 20

# Restarting apps:
echo 'Restarting apps...'
killall Finder
killall Dock

echo 'Setup Xcode'
xcode-select --install
sudo sudo xcodebuild -license

echo 'Done!'
