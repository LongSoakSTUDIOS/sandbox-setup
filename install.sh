USERNAME="LongSoakSTUDIOS"
NAME="Nicky B"
USEREMAIL="longsoakSTUDIOS@gmail.com"
REPO="holbertonschool-shell"

#grab bashrc from repo and save
if [[ -f ~/.bashrc ]]; then
	mv $HOME/.bashrc $HOME/.bashrc.bak;
fi
wget -qO ~/.bashrc https://raw.githubusercontent.com/$USERNAME/sandbox-setup/refs/heads/main/bashrc
				
