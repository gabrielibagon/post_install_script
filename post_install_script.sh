# A post-install-script for Ubuntu virtual machine
# Written by Gabriel Ibagon
# 
# Sources used:
#	http://askubuntu.com/questions/47404/how-do-i-make-post-install-scripts#comment53607_47406
#

## enable sources, add PPAs, and update sources:
## enabling all repositories, refreshing software list
sudo sed 's/# deb/deb/' -i /etc/apt/sources.list

#sublime ppa
sudo add-apt-repository -y ppa:webupd8team/sublime-text-3
#java 1.8 ppa
sudo add-apt-repository ppa:webupd8team/java
#spotify
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list

sudo apt-get -y --force-yes update
sudo apt-get -y --force-yes upgrade

## adding software and some dependencies from USC:
# List of programs
#	Java Runtime Environment
#	Java Development Kit
#	Sublime Text 3
#	TexLive
#	GDebi
#	spotify client
#
sudo apt-get -y install git-all default-jre default-jdk oracle-java8-installer sublime-text-installer spotify-client python-numpy texlive gdebi-core libxss1 libappindicator1 libindicator7

# installing google-chrome
sudo wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome*.deb

# installing remarkable (markdown editor)
sudo wget https://remarkableapp.github.io/files/remarkable_1.62_all.deb
sudo gdebi --non-interactive remarkable_1.62_all.deb

#remove applications
sudo rm -rf /usr/share/applications/ubuntu-amazon-default.desktop 

#add and remove programs from Unity Launcher
gsettings set com.canonical.Unity.Launcher favorites "['application://ubiquity.desktop', 'application://nautilus.desktop', 'application://gnome-terminal.desktop', 'application://google-chrome.desktop', 'application://sublime-text.desktop', 'application://spotify.desktop', 'applcation://puredata.desktop','application://remarkable.desktop', 'unity://running-apps', 'unity://expo-icon', 'unity://devices']"
#set up git
git config --global user.name "gabrielibagon"
git config --global user.email "gabriel.ibagon@gmail.com"

#openBCI setup
mkdir ~/OpenBCI
#install the GUI
sudo wget -P ~/OpenBCI http://openbci.com//apps/application.linux64.zip
sudo unzip ~/OpenBCI/application.linux64.zip -d ~/OpenBCI
sudo chmod 775 ~/OpenBCI/application.linux64.zip/OpenBCI_GUI

###install the python API and dependencies

## check if pip is installed, if not -> install
# get build essentials
sudo apt-get -y install python-setuptools python-dev build-essential 
# if pip is not installed, instal pip
if [ $(sudo dpkg-query -W -f='${Status}' pip 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
	sudo easy_install pip;
fi
sudo git clone https://github.com/OpenBCI/OpenBCI_Python.git ~/OpenBCI/OpenBCI_Python
sudo sed "1d" ~/OpenBCI/OpenBCI_Python/requirements.txt
sudo pip install -r ~/OpenBCI/OpenBCI_Python/requirements.txt 

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
