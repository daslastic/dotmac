#/bin/sh

# Close open System Preferences panes, to prevent them from overriding settings.
osascript -e 'tell application "System Preferences" to quit'

# dock
defaults write com.apple.dock autohide -bool true       # Autohide dock.
defaults write com.apple.dock tilesize -int 48          # Set dock icon size.
defaults write com.apple.dock magnification -bool true  # Enable dock magnification.
defaults write com.apple.dock largesize -int 83         # Set dock magnificated icon size.
defaults write NSGlobalDomain AppleInterfaceStyle Dark  # Use dark menu bar and dock.
defaults write com.apple.dock persistent-apps -array    # Delete all apps from dock.
defaults write com.apple.dock show-recents -bool false
defaults write -g AppleDisplayScaleFactor 0.75
defaults write com.apple.dock autohide-delay -float 0; defaults write com.apple.dock autohide-time-modifier -float 0.45;
killall Dock

# Expand print panel by default.
defaults write NSGlobalDomain NSNavPanelExpandedStateForPrintMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForPrintMode2 -bool true

# Expand save panel by default.
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Keyboard
defaults write NSGlobalDomain KeyRepeat -int 3         # Set fast key repeat rate.
defaults write NSGlobalDomain InitialKeyRepeat -int 12  # Set fast initial key repeat rate.

# Disable the "Are you sure you want to open this application?" dialog.
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Always open new documents in tabs.
defaults write NSGlobalDomain AppleWindowTabbingMode always

# Text correction
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false      # Disable automatic capitalization.

# Finder
defaults write com.apple.finder AppleShowAllFiles -bool true                 # Show hidden files.
defaults write NSGlobalDomain AppleShowAllExtensions -bool false              # Show all file extensions.
defaults write com.apple.finder FXEnableExtensionsChangeWarning -bool false  # Disable file extension change warning.
defaults write com.apple.finder ShowStatusBar -bool true                     # Show status bar.
defaults write com.apple.finder ShowPathbar -bool true                       # Show path bar.
defaults write com.apple.finder ShowRecentTags -bool false                   # Hide tags in sidebar.
defaults write com.apple.finder QuitMenuItem -bool true                      # Allow quitting finder via ⌘ + Q.
defaults write com.apple.finder SidebarWidth -int 120                        # less sidebar width.
defaults write com.apple.finder WarnOnEmptyTrash -bool false                 # No warning before emptying trash.
defaults write com.apple.finder FXPreferredViewStyle clmv

killall Finder

# Automatically quit printer app once the print jobs complete.
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Prevent Photos from opening automatically when devices are plugged in.
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true
# Stop iTunes from responding to the keyboard media keys.
launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist 2> /dev/null
# disable keychain
defaults write com.apple.keychainaccess ShowPrefsToolbar -bool false

brew services start yabai
brew services start skhd

sudo defaults write “/Library/Preferences/com.apple.mail” EnableBundles 1
defaults write com.apple.mail EnableBundles -bool true
defaults write com.apple.mail BundleCompatibilityVersion 4
