# .dotfiles

Things I need:
- Language specific things (syntax highlighting)
- VSplit starts at 100 column instead of half
- Fuzzy search
- Fade when not focussed
- Use nvim
- Maybe use nix?


## OLD

My configurations!

I'm starting from scratch. I want something I can `git clone` onto new computers and 
all the setup will be done for me. 

Initially I will have to symlink them manualls. I've seen some scripts 
(shoutout to @xLegoz for his [.dotfiles"](https://github.com/xLegoz/.dotfiles) inspiration) 
but I haven't decided on the strategy but it should be written in bash or python. 

This project is also going to be a listing for my TODO. I want to become a bit more 
independent from the big-web-corp, ideally creating an easy solution to privacy and 
safety on my computer. 

Useful for colourschemes: 
https://github.com/jwilm/alacritty/wiki/Color-schemes

TODO:

- Vim script:
  - https://vi.stackexchange.com/questions/415/adding-80-column-wide-comment-header-block-with-centered-text
  
- Antigen: 
  - Make antigen install using a clone from https://raw.githubusercontent.com/zsh-users/antigen/develop/bin/antigen.zsh 
- [ ] Install:
  - vundle, brew, oh-my-zsh
  - https://github.com/zsh-users/antigen
  - `brew install vim --with-override-system-vi`
  - vundle plugin install
  - iterm, tmux, solarized
  - `git config --global core.excludesfile ~/.gitignore_global`
  - `brew install fzf`
  - `brew install ripgrep`
  - `brew install cmake` for YouCompleteMe
  - Install https://golang.org/doc/install?download=go1.8.1.darwin-amd64.pkg
  - `git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions` for auto-suggestions
  - `git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting` for syntax highlighting
  - `python ~/.vim/bundle/YouCompleteMe/install.py --clang-completer --tern-completer --racer-completer --gocode-completer`
  - https://github.com/sindresorhus/caprine/blob/master/readme.md?ref=producthunt
  - http://rvm.io/rvm/install `\curl -sSL https://get.rvm.io | bash -s stable` and install ruby (`ruby-install`? )
  - https://github.com/vimwiki/vimwiki
  - https://valelint.github.io/docs/
  - https://github.com/universal-ctags/ctags
  - https://github.com/eapache/starscope
  - https://github.com/github/hub

- [ ] Install:
  - fzf, fzf-zsh, fzf-vim
  - look at https://github.com/amix/vimrc
  - https://github.com/nicknisi/dotfiles/blob/master/tmux/tmux.conf.symlink
  - read up on https://github.com/tpope/vim-dispatch
  - read https://github.com/fatih/vim-go-tutorial
  - try and get rid of Vundle by using native plugins like https://github.com/etiennebarrie/dotfiles
  - or use viml to install vundle like https://github.com/thegedge/dotfiles/blob/60b09c51693f5a9f9aaf0ad3045ce5c17a3d8115/vim/plugins.vimrc#L3-L10
  - remember to install python using brew, then install vim using brew with override, and make sure /usr/local/bin is before /usr/bin in path
- [ ] Look for a browser that:
  - has dotfiles configuration, 
  - preferable with vim bindings (enabled through those dotfiles)
  - some kind of syncing capabilities 
  - high security and anonymity
  - Check out https://wiki.archlinux.org/index.php/List_of_applications/Internet#Web_browsers
- [ ] Hook the YouCompleteMe compile into the script
- [ ] When on macOS do all teh brew stuff
  - `brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql qlimagesize webpquicklook suspicious-package`
  
- [ ] Investigate YubiKey or other USB-based secondary protection, either for entire OS or specific folders. 
  - Lots of Golang packages to interface with YubiKey. Also some Go packages for GUI's which will be useful.
- [ ] Look for a file syncing utility that is 
  - open source
  - secure
  - has a web interface 
  - locally managed?, maybe distributed, maybe with a central server?
- [ ] Look for high grade open source encryption
  - Apple has encryption baked into the OS. Can encrypt folders as new drives (.dmg). 
  - Can encrypt USB keys as well, password protected. Only works on OSX propreitary file system though. 
  - Probably want to look for / write an application that encrypts a drive, but has a program on it that will work cross platform to un-encrypt. 
  - https://camlistore.org/
  - https://bazil.org/ https://bazil.org/fuse/ Check out talks on this. Also just Bazil in general is a sweet project.
- [ ] Better email management (same qualities as above)
  - Host on email on Digital Ocean or Linode. 
  - See https://github.com/DrTeePot/sovereign 
  - See http://sealedabstract.com/code/nsa-proof-your-e-mail-in-2-hours/
- [ ] Better calendar management
  - See sovereign from above. However, may want to use NextCloud instead of OwnCloud. 
