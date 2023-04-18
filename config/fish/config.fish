if status is-interactive
    # Commands to run in interactive sessions can go here
end
set fish_greeting
source ~/.config/fish/aliases
starship init fish | source
alias backup='~/.config/fish/scrips/backup-files/backup.sh'

#install nekoray vpn in arch 
alias installvpn='yay -S nekoray-bin'
# function gcb
#   set branch (git ls-remote --symref $argv[1] HEAD | awk -F'/' '{print $3}')
#   if test -n "$argv[2]"
#     set branch $argv[2]
#   end
#   git clone --branch $branch $argv[1]
# end

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

# #tdfgo -j center -r print "IR-MB"
