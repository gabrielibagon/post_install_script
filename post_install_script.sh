# A post-install-script for Ubuntu virtual machine
# Written by Gabriel Ibagon
# 
# Sources used:
#	http://askubuntu.com/questions/47404/how-do-i-make-post-install-scripts#comment53607_47406
#	a



touch post_install_script
sudo 775 post_install_script
gedit post_install_script

## enable sources, add PPAs, and update sources:
## enabling all repositories, refreshing software list
sudo sed 's/# deb/deb/' -i /etc/apt/sources.lsit

sudo add-apt-repository -y ppa:webupd8team/sublime-text-3
sudo apt-get -y --force-yes update
sudo apt-get -y --force-yes upgrade

## adding software and some dependencies from USC:
sudo apt-get -y install git-all sublime-text-installer texlive gdebi-core libxss1 libappindicator1 libindicator7
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
#
#
# nme python
# processing 3
# openbci python api

# settings:
# -make python 3 default
# -put terminal on dash
# -remove amazon shit