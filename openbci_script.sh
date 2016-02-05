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
sudo git clone https://github.com/OpenBCI/OpenBCI_Python.git ~/OpenBCI
sudo sed "1d" ~/OpenBCI_Python/requirements.txt
sudo pip install -r ~/OpenBCI_Python/requirements.txt 
sudo apt-get install python-numpy
