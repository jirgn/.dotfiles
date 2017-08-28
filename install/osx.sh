#!/usr/bin/env sh
######################################################
# thanx to andi balke 
# https://github.com/pansen/dotfiles/blob/master/.osx

echo "\n\nConfiguring OS"
echo "=================="

# Google: disable autoupdate
# see http://support.google.com/installer/bin/answer.py?hl=en&ctx=go&answer=147176
echo "google: disable google updater"
defaults write com.google.Keystone.Agent checkInterval 0

# Mail: disable "Reply", "Send" animation
echo "mail: disable reply and send animation"
defaults write com.apple.Mail DisableSendAnimations -bool YES
defaults write com.apple.Mail DisableReplyAnimations -bool YES

# disable dashboard
echo "system: disable dashboard"
defaults write com.apple.dashboard mcx-disabled -boolean YES

# make the keyboard fast
echo "system: fasten keyboard"
defaults write NSGlobalDomain KeyRepeat -int 5

echo "Set a shorter Delay until key repeat"
defaults write NSGlobalDomain InitialKeyRepeat -int 10

# safari will ignore app-restore on restart
echo "safari: disable persistend state"
defaults write com.apple.Safari ApplePersistenceIgnoreState YES

# disable sonderzeichen keyboard behaviour
echo "system: disable keyboard press and hold"
defaults write -g ApplePressAndHoldEnabled -bool false

# show foldercontents in preview (space action)
echo "system: enable show foldercontents in preview"
defaults write com.apple.finder QLEnableXRayFolders -boolean yes

# full path in finder title
echo "finder: show full title"
defaults write com.apple.finder _FXShowPosixPathInTitle -bool YES

# screencapture preferences
echo "system: screencapture type png"
defaults write com.apple.screencapture type -string "png"

echo "system: screencapture location to ~/Desktop/screencapture"
defaults write com.apple.screencapture location -string "${HOME}/Desktop/screencapture"


# ipv6 stuff
# sudo su -c echo "net.inet6.ip6.use_tempaddr=1" >> /etc/sysctl.conf
#
# things from https://gist.github.com/2260182

echo "Enable full keyboard access for all controls (e.g. enable Tab in modal dialogs)"
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

echo "Show all filename extensions in Finder"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

echo "Use current directory as default search scope in Finder"
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

echo "Show Status bar in Finder"
defaults write com.apple.finder ShowStatusBar -bool true

echo "Expand save panel by default"
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

echo "Expand print panel by default"
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true

echo "Disable auto-correct"
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

echo "Increase window resize speed for Cocoa applications"
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

echo "Avoid creating .DS_Store files on network volumes"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

echo "Disable the warning when changing a file extension"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

echo "Enable tap to click (Trackpad)"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true

echo "Disable Safari’s thumbnail cache for History and Top Sites"
defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2

echo "Enable Safari’s debug menu"
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

echo "Only use UTF-8 in Terminal.app"
defaults write com.apple.terminal StringEncodings -array 4

echo "Make ⌘ + F focus the search input in iTunes"
defaults write com.apple.iTunes NSUserKeyEquivalents -dict-add "Target Search Field" "@F"

echo "Show the ~/Library folder"
chflags nohidden ~/Library

echo "Kill affected applications"
for app in Safari Finder Dock Mail SystemUIServer; do killall "$app" >/dev/null 2>&1; done

