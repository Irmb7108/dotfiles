if status is-interactive
    # Commands to run in interactive sessions can go here
end
set fish_greeting
source ~/.config/fish/aliases
source ~/.config/fish/backup_files.fish
starship init fish | source
alias backup='chmod +x ~/.config/fish/scrips/backup-files/backup.sh && ~/.config/fish/scrips/backup-files/backup.sh'
#alias backup='~/.config/fish/scrips/backup-files/backup.sh'
abbr con 'ping -c 5 8.8.8.8' # Check network
abbr myip 'curl ifconfig.co' # Print public IP
abbr untar 'tar -zxvf'
#install nekoray vpn in arch 
alias installvpn='yay -S nekoray-bin'
# function gcb
#   set branch (git ls-remote --symref $argv[1] HEAD | awk -F'/' '{print $3}')
#   if test -n "$argv[2]"
#     set branch $argv[2]
#   end
#   git clone --branch $branch $argv[1]
# end
set -gx CHATGPT_API_KEY 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
#download in GitHub file in commands scripts 
function gcb
  set branch "master"
  read -P "Enter GitHub repository link: " repo_link
  read -P "Enter target directory name: " dir_name
  if test -n "$argv[2]"
    set branch $argv[2]
  end
  git clone --branch $branch $repo_link $dir_name
end
# # echo "

# #           ▀▀▀▀       ▀■▄▄▄       ▐■▄       ░░░░      ▀▄▄▄     
# #           ▐▓██▓▌  ▐▓██▓▓█▓▓▓▄▄▄   █▄▒▒▄▄ ▄▄▓▒█▓▓  ▐▓██▓▓▓███▄▄ 
# #           ▐▒▓▓▓▌  ▐▒▓▓▓██████▓█▌  ▓▒░░▒░▄█▓█░░▒▌  ▐▒▓▓▓███░░░█▌
# #           ▐░▒▒▒▌  ▐░▒▒▒▀▀▀ ▒▓░░▌  ▒▓▓▓▀██▀▀▓▓▓░▒  ▐░▒▒▒▀▀▀▓▒▒▒▓
# #           ▐░░░░▌  ▐░░░░█  ▄▓▓▓▓█  ░░▒▒▌▐▓ ▐░░░█░  ▐░░░░   ▀▀██▀
# #           ▀▒▓▓▓▌  ▀▒▓▓▓░▄▒▓▓▓▀▀▀  ▓▓░░▒ ░ ░▓▓▓░▀  ▀▒▓▓░█░░▒▓▓▄ 
# #           ▐▒▒▒▒▌  ▐▒▒▒▒▌▀▀▓▓▄▄    ░░▓▓▓   ░▒▒▒░▌  ▐▒▒▒▒▄  ▄▒▓▓▓
# #           ▐░░░░░  ▐░░░░░  ▀░░░░░  ▓ ░░░   ▒░░░░   ▐░░░░░░░░░░░▀
# # " |lolcat
# tdfgo -j center -f yazoox print "IR-MB" |lolcat
