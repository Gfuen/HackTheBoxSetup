#!/bin/bash
# make sure we're root
if [ "$HOME" != "/root" ]
then
    echo -e "${GREEN}[*] Please run as root.${NC}"
    exit 1
fi

#Colors
GREEN='\033[0;32m'
NC='\033[0m'

#Install dependencies
echo -e "${GREEN}[*] Apt update${NC}"
apt-get update

#Install xterm
echo -e "${GREEN}[*] Installing XTERM${NC}"
apt-get install -y xterm

#Install pip3
echo -e "${GREEN}[*] Installing Python3-pip${NC}"
apt-get install -y python3-pip

#Install venv for pipx virtual environments
echo -e "${GREEN}[*] Installing Python3-venv${NC}"
apt-get install -y python3-venv

#Install pipx 
echo -e "${GREEN}[*] Installing Pipx${NC}"
xterm -e bash -c 'python3 -m pip install pipx; python3 -m pipx ensurepath'

#Make Zsh default shell
echo -e "${GREEN}[*] Change default shell to Zsh${NC}"
chsh -s /bin/zsh

# Make sure pipx is installed
echo -e "${GREEN}[*] Checking if PIPX is installed${NC}"
if pip list | grep -F pipx &> /dev/null; then
    echo -e "${GREEN}[*] Pipx installed${NC}"
else
    echo 'uh oh. Pipx is not installed.'
    exit 1
fi

#Install other dependencies
echo -e "${GREEN}[*] Installing Dependencies that arent bug bounty tools${NC}"
apt-get install -y vim
apt-get install -y dos2unix
apt-get install -y rlwrap
apt-get install -y gnome-screenshot
apt-get install -y golang
apt-get install -y powershell
apt-get install -y xclip
apt-get install -y cmake
apt-get install -y grc
apt-get install -y awscli
apt-get install -y build-essential
apt-get install -y gcc 
apt-get install -y git
apt-get install -y vim 
apt-get install -y wget 
apt-get install -y curl
apt-get install -y inetutils-ping 
apt-get install -y make 
apt-get install -y nmap 
apt-get install -y whois 
apt-get install -y python-pip 
apt-get install -y perl 
apt-get install -y nikto
apt-get install -y dnsutils 
apt-get install -y net-tools
apt-get install -y zsh
apt-get install -y nano
apt-get install -y tmux

#Install gnumeric for converting excel files
apt-get -y install gnumeric

#Need to uninstall
#sudo rm /usr/bin/lsb_release

#Install ferox buster
echo -e "${GREEN}[*] Installing Feroxbuster${NC}"
apt install -y feroxbuster

#Install pure-ftpd
echo -e "${GREEN}[*] Installing pure-ftpd${NC}"
apt install -y pure-ftpd

#Install fcrackzip for cracking zip files with passwords
echo -e "${GREEN}[*] Installing fcrackzip${NC}"
apt-get install fcrackzip

#Install seclists for passwords
echo -e "${GREEN}[*] Installing Seclists${NC}"
apt-get install seclists

#Install Python ssl module
echo -e "${GREEN}[*] Installing Python SSL Module${NC}"
sudo apt-get install -y libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev

#Install exa
echo -e "${GREEN}[*] Installing EXA${NC}"
apt install exa

#Make folders
cd /home/kali/Desktop/
mkdir -p HTB

#Create Tools Dir
cd ~/
mkdir -p Tools
mkdir -p Scripts
mkdir -p Config

#Install python2to3
echo -e "${GREEN}[*] Installing 2to3${NC}"
python3 -m pipx install 2to3

#Install tldr 
echo -e "${GREEN}[*] Installing tldr${NC}"
python3 -m pipx install tldr.py

#Install Impacket
echo -e "${GREEN}[*] Installing Impacket${NC}"
python3 -m pipx install git+https://github.com/SecureAuthCorp/impacket.git
python3 -m pipx ensurepath

#Install bloodhound
echo -e "${GREEN}[*] Installing Bloodhound${NC}"
python3 -m pipx install bloodhound
python3 -m pipx ensurepath

#Unzip Rockyou
echo -e "${GREEN}[*] Installing rockyou.txt${NC}"
gunzip /usr/share/wordlists/rockyou.txt.gz 2>/dev/null
ln -s /usr/share/wordlists ~/Downloads/wordlists 2>/dev/null

#Install packages for dirsearch
echo -e "${GREEN}[*] Installing dirsearch${NC}"
python3 -m pipx install urllib3
python3 -m pipx install chardet
python3 -m pipx install certifi
cd ~/Tools
git clone https://github.com/maurosoria/dirsearch.git

#Install Autorecon
echo -e "${GREEN}[*] Installing Autorecon${NC}"
python3 -m pipx install git+https://github.com/Tib3rius/AutoRecon.git
python3 -m pipx ensurepath

#Install Updog
echo -e "${GREEN}[*] Installing Updog${NC}"
python3 -m pipx install updog
python3 -m pipx ensurepath

#Install Nishang
echo -e "${GREEN}[*] Installing Nishang${NC}"
cd ~/Tools
git clone https://github.com/samratashok/nishang.git

#Add Scripts to Directory for PrivEsc 
echo -e "${GREEN}[*] Installing Privesc Scripts${NC}"
cd ~/Scripts
git clone https://github.com/HarmJ0y/PowerUp.git
git clone https://github.com/M4ximuss/Powerless.git
git clone https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite/tree/master/winPEAS.git
git clone https://github.com/rasta-mouse/Watson.git
git clone https://github.com/bitsadmin/wesng.git
git clone https://github.com/diego-treitos/linux-smart-enumeration.git
git clone https://github.com/cwinfosec/revshellgen

#dont use option -e on suidenum
mkdir -p SUID
cd ~/Scripts/SUID
wget https://raw.githubusercontent.com/Anon-Exploiter/SUID3NUM/master/suid3num.py --no-check-certificate && chmod 777 suid3num.py

# massdns
echo -e "${GREEN}[*] Installing massdns${NC}"
apt-get install -y libldns-dev
cd ~/Tools
git clone https://github.com/blechschmidt/massdns.git
cd massdns/
make
ln -sf ~/Tools/massdns/bin/massdns /usr/local/bin/massdns

# thc-hydra
echo -e "${GREEN}[*] Installing thc-hydra${NC}"
apt-get install -y hydra

# Sublist3r
echo -e "${GREEN}[*] Installing Sublist3r${NC}"
cd ~/Tools
git clone https://github.com/aboul3la/Sublist3r.git
cd Sublist3r/
pip3 install -r requirements.txt
ln -s ~/Tools/Sublist3r/sublist3r.py /usr/local/bin/sublist3r

# sqlmap
echo -e "${GREEN}[*] Installing sqlmap${NC}"
apt-get install -y sqlmap

# wfuzz
echo -e "${GREEN}[*] Installing wfuzz${NC}"
pip3 install --upgrade setuptools 
apt-get install -y python-pycurl 
pip3 install wfuzz

# wafw00f
echo -e "${GREEN}[*] Installing wafw00f${NC}"
cd ~/Tools
git clone https://github.com/enablesecurity/wafw00f.git 
cd wafw00f 
chmod +x setup.py 
python setup.py install

# wpscan
echo -e "${GREEN}[*] Installing wpscan${NC}"
apt-get install -y libcurl4-openssl-dev libxml2 libxml2-dev libxslt1-dev ruby-dev libgmp-dev zlib1g-dev 
cd ~/Tools
git clone https://github.com/wpscanteam/wpscan.git 
cd wpscan/ 
gem install bundler && bundle install --without test 
gem install wpscan

# joomscan
echo -e "${GREEN}[*] Installing joomscan${NC}"
cd ~/Tools
git clone https://github.com/rezasp/joomscan.git 
cd joomscan/ 
apt-get install -y libwww-perl 
chmod +x joomscan.pl
ln -sf ~/toolkit/joomscan/joomscan.pl /usr/local/bin/joomscan

# s3recon
echo -e "${GREEN}[*] Installing s3recon${NC}"
pip3 install setuptools pyyaml pymongo requests s3recon

# whatweb 
echo -e "${GREEN}[*] Installing whatweb${NC}"
cd ~/Tools
git clone https://github.com/urbanadventurer/WhatWeb.git
cd WhatWeb
chmod +x whatweb
ln -sf ~/Tools/WhatWeb/whatweb /usr/local/bin/whatweb

#Refresh Zsh profile before installing pyenv
echo -e "${GREEN}[*] Reload Zsh profile${NC}"
source ~/.zshrc

#Install pyenv
echo -e "${GREEN}[*] Installing Pyenv${NC}"
apt install -y build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python3-openssl git
curl https://pyenv.run | bash
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.zshrc

#Init Metasploit
systemctl start postgresql
systemctl enable postgresql
msfdb init

#Install Chisel binaries
cd ~/Tools
git clone https://github.com/jpillora/chisel/releases/download/v1.7.4/chisel_1.7.4_linux_amd64.gz
git clone https://github.com/jpillora/chisel/releases/download/v1.7.4/chisel_1.7.4_windows_amd64.gz

#Install Configs
cd ~/Config
wget -q --show-progress -N https://raw.githubusercontent.com/Gfuen/HackTheBoxSetup/main/Gfuen640.ovpn -P ~/Config

