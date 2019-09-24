# 隠しファイル・フォルダを表示する
defaults write com.apple.finder AppleShowAllFiles -bool true
# Finderのタイトルにフルパスを表示する
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
# スクリーンショットの影を消す
defaults write com.apple.screencapture disable-shadow -bool true
# ネットワーク上に.DS_Storeを作らない
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
# ダウンロードしたファイルを初めて開く際に表示される警告ダイアログを表示しない
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Finderの再起動
killall Finder

# SystemUIServerの再起動
killall SystemUIServer