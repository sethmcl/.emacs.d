# Setup Emacs OSX

```sh
# install emacs with brew
brew install emacs -HEAD --use-git-head --cocoa --srgb

# copy Emacs.app to Applications folder
sudo cp -r /usr/local/Cellar/emacs/Emacs.app /Applications

# copy plist to run emacs daemon
cp run.emacsdaemon.plist ~/Library/LaunchAgents
```
