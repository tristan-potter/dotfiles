# .dotfiles

My configurations!

I'm starting from scratch. I want something I can `git clone` onto new computers and 
all the setup will be done for me. 

Initially I will have to symlink them manualls. I've seen some scripts 
(shoutout to @xLegoz for his [.dotfiles"](https://github.com/xLegoz/.dotfiles) inspiration) 
but I haven't decided on the strategy but it should be written in bash or python. 

This project is also going to be a listing for my TODO. I want to become a bit more 
independent from the big-web-corp, ideally creating an easy solution to privacy and 
safety on my computer. 

TODO:

- [ ] Look for a browser that:
  - has dotfiles configuration, 
  - preferable with vim bindings (enabled through those dotfiles)
  - some kind of syncing capabilities 
  - high security and anonymity
  - Check out https://wiki.archlinux.org/index.php/List_of_applications/Internet#Web_browsers
- [ ] Hook the YouCompleteMe compile into the script
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
