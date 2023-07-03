#!/bin/sh

osascript -e 'tell application "System Preferences" to quit'

# dock
defaults write com.apple.dock show-recents -bool false
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0.45
killall Dock

# Disable the "Are you sure you want to open this application?" dialog.
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Text correction
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false # Disable automatic capitalization.

# Finder
defaults write com.apple.finder AppleShowAllFiles -bool true # Show hidden files.

killall Finder

# Prevent Photos from opening automatically when devices are plugged in.
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true
# Stop iTunes from responding to the keyboard media keys.
launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist 2>/dev/null
# disable keychain
defaults write com.apple.keychainaccess ShowPrefsToolbar -bool false

brew services start yabai
brew services start skhd

sudo defaults write “/Library/Preferences/com.apple.mail” EnableBundles 1
defaults write com.apple.mail EnableBundles -bool true
defaults write com.apple.mail BundleCompatibilityVersion 4
defaults write -g ApplePressAndHoldEnabled 0
