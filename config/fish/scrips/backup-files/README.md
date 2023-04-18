# Backup Script

A Bash script for backing up directories and files, which creates backup folders with timestamps and copies the requested files.

## Prerequisites 

Before running this script, make sure that you have the following packages installed:
- `lolcat`
- `git`

In case any of these packages is missing, the script will prompt you to install them.

## Usage 
1. Clone the repository to your desired directory using git: `git clone https://github.com/Irmb7108/backup-file`
2. Open the cloned repository directory: `cd backup-file`
3. run `chmod +x backup.sh`
4. Run the script: `./backup.sh`
5. Follow the instructions that appear on the screen.

## Features 
- If a necessary package is not found, the script asks if you would like to install it.
- Creates a directory with timestamps and copies backup files there.
- Copies only backup files into the created directory.
- Shows the progress of copying files through an animated spinner.
- Writes the backup information to `backup_$(date "+%H-%M-%S").md` file.

## Dependencies 
This script requires the following packages to be installed:
- `git`
- `lolcat` 
- `figlet`



## Credits 
Created by **IR-MB.**

**Contributions from ChatGPT AI during the project are greatly appreciated!**

![mycode](https://s2.uupload.ir/files/screenshot_20230313_004422_7jsq.png)



