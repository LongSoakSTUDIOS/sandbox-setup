USERNAME="LongSoakSTUDIOS"
NAME="Nicky B"
USEREMAIL="longsoakSTUDIOS@gmail.com"
REPO="holbertonschool-shell"

#grab bashrc from repo and save
if [[ -f ~/.bashrc ]]; then
	mv $HOME/.bashrc $HOME/.bashrc.bak;
fi
wget -qO ~/.bashrc https://raw.githubusercontent.com/$USERNAME/sandbox-setup/blob/main/bashrc
echo "bashrc added"

if [[ -f ~/.bash_aliases ]]; then
	mv $HOME/.bash_aliases $HOME/.bash_aliases.bak;
fi
wget -qO ~/.bash_aliases https://raw.githubusercontent.com/$USERNAME/blob/main/bash_aliases
echo "aliases added"

git config --global user.email "$USEREMAIL";
git config --global user.name "$NAME";
git config --global credential.helper 'cache --timeout=7200';

GrabRepo()
{
	read -p "Please enter your repo name :" REPO;
	if [! -d "$HOME/$REPO ]; then
		git clone "https://github.com/$USERNAME/$REPO.git";
	fi
}

GrabRepo

rmdf()
{
	DF=("empty_directory" "my_school" "not_here" "old_school" "ready_to_be_removed" "school");
	echo "Would you like to remove the defualt folders and files from the holberton sandbox";
	echo "${DF[*]}";
	read -p $'y/n: ' -r remove;
	if [[ "$remove" == "y" ]];then
		echo "removing defualts!";
		for d in "${DF[@]}"; do
			if [[ -d "$HOME/$d" || -f "$HOME/$d" ]]; then
				rm -r "$d";
			fi;
		done		
	else
		echo "not removing";
	fi
}

rmdf
source ~/.bashrc
