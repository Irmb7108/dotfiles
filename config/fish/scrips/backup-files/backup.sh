#!/bin/bash

echo -e '\033[8;30;'$(tput colors)';120t'

# Checking if 'lolcat' package is installed and proceeding with the installation if missing
check_dep() {
    local dep=$(which "$1" 2>/dev/null)
    if [[ -z "$dep" ]]; then
        read -p "The $1 package is not found! Do you want me to install it for you? [y/n]: " choice
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

# Check for 'figlet' package
check_dep "figlet"
check_dep "lolcat"

echo ""
echo ""
figlet -cf smslant "IR-MB" | lolcat
echo ""
echo ""
text="Welcome to my script!"
figlet -cf term "$text"|lolcat
echo ""

echo "------------------------------------------------------"
echo -e "\033[48;5;24m\033[38;5;15m  # copy only backup files to backup directory   \033[m"
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
backup_dir="backup_$(date "+%H.%M.%S")"
if [ ! -d "$backup_dir" ]; then
  mkdir "$backup_dir"
fi

# backup directories and files
echo "Starting backup..."
for dir in */; do
  dir=${dir%*/}   
  # Remove the trailing "/"
  echo "Backing up $dir..."
  rsync -a --delete --exclude=".git" "$dir/" "$backup_dir/$dir/"
done
echo "Backup completed."

# copy only backup files to backup directory
echo "Copying backup files to directory: $backup_dir"
total_files=$(find . -type f | wc -l)
progress=-1 
# so percentage starts from 0
current_file=0
copied_files_count=0
for file in *; do
  ((current_file++))
  percentage=$(expr $current_file \* 100 / $total_files)
  if [[ -f "$file" && $(basename "$file") != "$(basename "$0")" ]]; then
    cp -rf "$file" "$backup_dir" &
    tput civis;
    printf "\rCopying...[%d%%]" $percentage
    spinner
    ((copied_files_count++))
  fi
done
echo ""
filename="backup_$(date "+%H-%M-%S").md"
cd $backup_dir 
touch "$filename"
echo "# Backup Information" >> "$filename"

echo "" >> "$filename"
echo "## Backup Time: $(date)" >> "$filename"
echo "## Backed Up By: $(whoami)" >> "$filename" 
echo "## Backed Up Folder Name: $backup_dir" >> "$filename"
echo "## Backed Total files copied: ${copied_files_count}" >>"$filename"

# copy requested file to backup directory
# set the color to blue
BLUE='\033[0;34m'    

echo "Copy completed."
echo "The backup directory is: ${backup_dir}"
printf "${BLUE}Total files copied: ${copied_files_count}${NC}\n"
echo -e '\e[32mThe Backup Process has been completed successfully!\e[0m'
echo " "
echo " "

text="Created By IR-MB!"
figlet -cf term "$text" |lolcat
