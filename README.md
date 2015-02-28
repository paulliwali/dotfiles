dotfiles.git
============
Clone and run this on a new EC2 instance running Ubuntu 12.04.2 LTS to
configure your `bash` and `emacs` and `vim` development environment as follows:

```sh
cd $HOME
git clone ssh://git@github.com/paulliwali/dotfiles.git
ln -sf dotfiles/.bash_profile .
ln -sf dotfiles/.bashrc .
ln -sf dotfiles/.bashrc_custom .
ln -sf dotfiles/.vimrc .
# Moving vim color schemes into the appropriate color folder
cd .vim
ln -sf ~/dotfiles/.vim/colors .
cd $HOME
```

See also http://github.com/paulliwali/setup to install prerequisite
programs. If all goes well, in addition to a more useful prompt, now you can
do `emacs -nw hello.js` and hitting `C-c!` to launch an interactive SSJS
REPL, among many other features. See the
[Startup Engineering Video Lectures 4a/4b](https://class.coursera.org/startup-001/lecture/index)
for more details.
