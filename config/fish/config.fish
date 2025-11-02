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

# Run #!/bin/bash scripts in Fish without conflict
function runbash --description 'Run script with bass if shebang is bash'
    set -l file $argv[1]
    if not test -f "$file"
        echo "Error: File not found: $file"
        return 1
    end
    set -l shebang (head -n1 "$file" 2>/dev/null | string trim)
    if string match -qr 'bash$' "$shebang"
        __fish_bass source "$file" $argv[2..-1]
    else
        command bash "$file" $argv[2..-1]
    end
end

# Override the default execution for ./script.sh
function . --description 'Auto-detect bash scripts'
    set -l file $argv[1]
    if not test -f "$file"
        command . $argv
        return
    end
    set -l shebang (head -n1 "$file" 2>/dev/null | string trim)
    if string match -qr 'bash$' "$shebang"
        __fish_bass source "$file" $argv[2..-1]
    else
        command . $argv
    end
end

# === Safe bass wrapper ===
function __fish_bass
    set -l bass_path (type -p bass 2>/dev/null | grep -v "/usr/bin/bass" | head -n1)
    if test -z "$bass_path"
        echo "Error: bass plugin not found. Run: fisher install jorgebucaran/bass"
        return 1
    end
    eval "$bass_path $argv"
end

# === Auto-run #!/bin/bash scripts ===
function .
    set -l file $argv[1]
    if not test -f "$file"
        command . $argv
        return
    end
    set -l shebang (head -n1 "$file" 2>/dev/null | string trim)
    if string match -qr 'bash$' "$shebang"
        __fish_bass source "$file" $argv[2..-1]
    else
        command . $argv
    end
end
