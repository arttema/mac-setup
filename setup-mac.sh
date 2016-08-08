if ! command -v brew >/dev/null; then
  echo "Installing Homebrew ..."
    curl -fsS \
      'https://raw.githubusercontent.com/Homebrew/install/master/install' | ruby

    export PATH="/usr/local/bin:$PATH"
else
  echo "Homebrew already installed. Skipping ..."
fi

brew install brew-cask
brew update && brew upgrade brew-cask && brew cleanup && brew cask cleanup
rew install git
brew install git-flow
brew install wget
echo "Installing brew packages"

#all things java
brew install maven
brew install mongodb
brew install scala
brew install sbt
brew tap pivotal/tap
brew install springboot

#node
rm -rf /usr/local/lib/node_modules
brew uninstall node
brew install node --without-npm
echo prefix=~/.npm-packages >> ~/.npmrc
curl -L https://www.npmjs.com/install.sh | sh
export PATH="$HOME/.node/bin:$PATH"

brew install bower
brew install bower

echo "Now Installing casks"
brew cask install virtualbox
brew cask install java



#native apps
brew cask install dropbox
brew cask install evernote
brew cask install google-chrome
brew cask install google-drive
brew cask install evernote
brew cask install intellij-idea

brew cask install slack
brew cask install trello
brew cask install spotify
brew cask install skype
brew cask install viber
brew cask install robomongo
brew cask install vlc
brew cask install flash
brew cask install appcleaner
brew cask install sublimetext

echo "set up default mac plain-text viewer. Makes ALL text files to be opened in Sublime"
defaults write com.apple.LaunchServices/com.apple.launchservices.secure LSHandlers -array-add \
'{LSHandlerContentType=public.plain-text;LSHandlerRoleAll=com.sublimetext.3;}'

