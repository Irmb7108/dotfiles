#!/bin/bash
# Setting color codes
RED='\033[0;31m'
NC='\033[0m' # No Color
# Checking if 'rsync' package is installed and proceeding with the installation if missing
check_dep() {
    local dep=$(which "$1" 2>/dev/null)
    if [[ -z "$dep" ]]; then
        echo -e "${RED}The $1 package is not found! Do you want me to install it for you? [y/n]:${NC} \c" 
        read choice
        case "$choice" in 
            y|Y ) 
                echo "Installing $1 package..."
                sudo pacman -S --noconfirm "$1"
                ;;
            n|N ) ;;
            * )     echo "Please type (y)es or (n)o." && check_dep $1;;
        esac
    fi
}

# Check for 'rsync', 'figlet', and 'lolcat' packages
check_dep "rsync"
check_dep "figlet"
check_dep "lolcat"

echo -e '\033[8;30;'$(tput colors)';120t'
echo ""
echo ""
figlet -cf smslant "IR-MB" | lolcat
echo ""
echo ""
text="Welcome to my script!"
figlet -cf term "$text"|lolcat
echo ""

echo "------------------------------------------------------"
echo -e "\033[48;5;24m\033[38;5;15m  # Backup process   \033[m"
echo "------------------------------------------------------"
echo ""
# echo " "
# cols=$(tput cols)
# rows=$(tput lines)

# tput setaf 2 # font color green
# tput cup $((rows/2)) $(( (cols-${#text})/2 ))
# echo "$text"
# tput sgr0 # reset font color
read -p "Do you want to backup your files? [y/n]:" backup_choice
case "$backup_choice" in 
    y|Y ) 
        ;;
    n|N ) 
        echo "Backup process aborted by user."
        exit 0
        ;;
    * )     
        echo "Invalid input, backup process will be terminated."
        exit 1
        ;;
esac
function spinner {
  local pid=$!
  local delay=0.1
  local spinstr='|/-\'
  tput civis;
  while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
    local temp=${spinstr#?}
    printf " [%c] " "$spinstr"
    local spinstr=$temp${spinstr%"$temp"}
    sleep $delay
    tput civis;
    printf "\b\b\b\b\b\b"
  done
  printf "    \b\b\b\b"
  tput cnorm;
}

# create backup directory
#backup_dir="backup"
#backup_dir="backup_$(date "+%H%M%S")"
backup_dir="backup_$(date "+%H.%M.%S")"
if [ ! -d "$backup_dir" ]; then
  mkdir "$backup_dir"
fi

# backup directories and files
echo "Starting backup..."
rsync -avh --exclude=".git" ./ "$backup_dir/"
echo "Backup completed."

filename="$backup_dir/backup_$(date "+%H-%M-%S").md"
touch "$filename"
echo "# Backup Information" >> "$filename"

echo "" >> "$filename"
echo "## Backup Time: $(date)" >> "$filename"
echo "## Backed Up By: $(whoami)" >> "$filename" 
echo "## Backed Up Folder Name: $backup_dir" >> "$filename"
echo "## Backed Total files copied: $(ls -1 "$backup_dir" | wc -l)" >>"$filename"

BLUE='\033[0;34m'    
echo "The backup directory is: ${backup_dir}"
printf "${BLUE}Total backup files copied: $(ls -1 "$backup_dir" | wc -l)${NC}\n"
echo -e '\e[32mThe Backup Process has been completed successfully!\e[0m'
echo " "
echo " "

text="Created By IR-MB!"
figlet -cf term "$text" |lolcat



