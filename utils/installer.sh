DEFAULT_INSTALL_DIR="$HOME/dotfiles"
DOTFILE_REPO="https://github.com/b-boogaard/dotfiles.git"

RESET='\e[0m'           # Reset
RED='\e[0;31m'          # Red
GREEN='\e[0;32m'        # Green
YELLOW='\e[0;33m'       # Yellow
BLUE='\e[0;34m'         # Blue
PURPLE='\e[0;35m'       # Magenta
CYAN='\e[0;36m'         # Cyan
WHITE='\e[0;37m'        # White
BRED='\e[1;31m'         # Bold Red
BGREEN='\e[1;32m'       # Bold Green
BYELLOW='\e[1;33m'      # Bold Yellow
BBLUE='\e[1;34m'        # Bold Blue
BPURPLE='\e[1;35m'      # Bold Magenta
BCYAN='\e[1;36m'        # Bold Cyan
BWHITE='\e[1;37m'       # Bold White

# Check for git
printf  "$CYAN Checking to see if git is installed... $RESET"
if hash git 2>&-
then
    printf "$GREEN found.$RESET\n"
else
    printf "$RED not found. Aborting installation!$RESET\n"
    exit 1
fi

# Check if dotfile directory already exists
if [ -d "$DEFAULT_INSTALL_DIR" ]
then
  # Directory exists. Back it up
  printf "$YELLOW Backing up existing dotfile directory to $DEFAULT_INSTALL_DIR.backup.tar\n$RESET"
  tar -cf "$DEFAULT_INSTALL_DIR.backup.tar" "$DEFAULT_INSTALL_DIR" > /dev/null 2>&1

elif [ -e "$DEFAULT_INSTALL_DIR" ]
then
  printf "$RED $DEFAULT_INSTALL_DIR exists but isn't a regular directory or file.\n$RESET"
  printf "$RED It needs to be removed to continue.\n$RESET"
  printf "$RED Aborting installation.\n$RESET"

  exit 1
fi

# Recreate destination directory for git clone.
rm -rf "$DEFAULT_INSTALL_DIR"
mkdir "$DEFAULT_INSTALL_DIR"

printf "$CYAN Cloning dotfiles directory from $DOTFILE_REPO\n$RESET"
/usr/bin/env git clone $DOTFILE_REPO "$DEFAULT_INSTALL_DIR" > /dev/null 2>&1

if ! [ $? -eq 0 ]
then
  printf "$RED A fatal error occurred while cloning repository. Aborting.\n$RESET"
  exit 1
fi

# Create symlinks to home directory
for file in ".vimrc" ".gitignore" ".zshrc" ".tmux.conf" ".eclimrc"
do
  if [ -L "$HOME/$file" ]
  then
    unlink "$HOME/$file"
  fi

  ln -s "$DEFAULT_INSTALL_DIR/$file" "$HOME/$file"
done

printf "$GREEN All done.\n$RESET"
