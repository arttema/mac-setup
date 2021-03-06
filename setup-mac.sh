#!/usr/bin/env bash
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
brew tap beeftornado/rmtree && brew install brew-rmtree
echo "Installing brew packages"

installJavaEnv
installScaleEnv
installJSCommon
installReactNative
installAndroid
installCaskApps
installDevOps
installDatabases
installTools

#all things java
function installJavaEnv {
brew cask install java
brew install maven
brew tap pivotal/tap
brew install springboot
brew install gradle
}


function installScaleEnv {
brew install scala
brew install sbt
brew install typesafe-activator
}

function installJSCommon {
#node
rm -rf /usr/local/lib/node_modules
brew uninstall node
brew install node --without-npm
echo prefix=~/.npm-packages >> ~/.npmrc
curl -L https://www.npmjs.com/install.sh | sh
export PATH="$HOME/.node/bin:$PATH"
brew install bower

sudo npm install -g eslint
sudo npm install -g eslint-config-react-app@0.2.1 eslint@3.5.0 babel-eslint@6.1.2 eslint-plugin-react@6.3.0 eslint-plugin-import@1.12.0 eslint-plugin-jsx-a11y@2.2.2 eslint-plugin-flowtype@2.18.1
}

function installReactNative {
brew install watchman
sudo npm install -g react-native-cli
#Mobile App icon resizing
brew install imagemagick && sudo npm i -g ticons
}

function installAndroid {
brew install android-sdk
echo "export ANDROID_HOME=/usr/local/opt/android-sdk" >> ~/.bash_profile
echo "enabling gradle incremental build Daemon"
touch ~/.gradle/gradle.properties && echo "org.gradle.daemon=true" >> ~/.gradle/gradle.properties
}

echo "Now Installing casks"
brew cask install virtualbox

#native apps
function installCaskApps{
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
#brew cask install flash
brew cask install appcleaner
brew cask install sublimetext
}

function installDevOps {
brew install heroku-toolbelt
brew install ec2-api-tools
brew install awscli

}

function installDatabases {
brew install postgresql
brew install mongodb
}

function installTools {
brew install rbenv
brew install gdk-pixbuf
brew install imagemagick
brew install python
brew install jbig2dec
brew install rbenv
brew install wget
}


echo "set up default mac plain-text viewer. Makes ALL text files to be opened in Sublime"
defaults write com.apple.LaunchServices/com.apple.launchservices.secure LSHandlers -array-add \
'{LSHandlerContentType=public.plain-text;LSHandlerRoleAll=com.sublimetext.3;}'