touch post_install_script
sudo 775 post_install_script
gedit post_install_script

## enable sources, add PPAs, and update sources:
## enabling all repositories, refreshing software list
sudo sed 's/# deb/deb/' -i /etc/apt/sources.lsit

sudo add-apt-repository ppa:webupd8team/sublime-text-3
sudo apt-get update

## adding software and some dependencies from USC:
sudo apt-get install git-all sublime-text-installer texlive gdebi-core libxss1 libappindicator1 libindicator7
sudo wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome*.deb
sudo wget https://remarkableapp.github.io/files/remarkable_1.62_all.deb
sudo gdebi remarkable_1.62_all.deb


# list of apps:
# sublime-text
# tex live
# chrome
# remarkable
# git
# nme python
# processing 3
# openbci python api

# settings:
# -make python 3 default
# -put terminal on dash
# -remove amazon shit