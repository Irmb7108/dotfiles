if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -g fish_greeting

# Sources
test -f ~/.config/fish/aliases; and source ~/.config/fish/aliases
test -f ~/.config/fish/backup_files.fish; and source ~/.config/fish/backup_files.fish

type -q starship; and starship init fish | source

# PATH Configuration
fish_add_path $HOME/.local/bin

# Aliases & Abbreviations
alias backup='chmod +x ~/.config/fish/scrips/backup-files/backup.sh && ~/.config/fish/scrips/backup-files/backup.sh'
alias fix-maximized='kwriteconfig6 --file ~/.config/kwinrc --group Windows --key BorderlessMaximizedWindows false && echo "BorderlessMaximizedWindows set to false ✅"'
alias installvpn='yay -S nekoray-bin'

abbr con 'ping -c 5 8.8.8.8'
abbr myip 'curl ifconfig.co'
abbr untar 'tar -zxvf'

# Banner
if type -q lolcat
    echo "
            ▀▀▀▀        ▀■▄▄▄        ▐■▄        ░░░░       ▀▄▄▄     
            ▐▓██▓▌   ▐▓██▓▓█▓▓▓▄▄▄    █▄▒▒▄▄ ▄▄▓▒█▓▓   ▐▓██▓▓▓███▄▄ 
            ▐▒▓▓▓▌   ▐▒▓▓▓██████▓█▌   ▓▒░░▒░▄█▓█░░▒▌   ▐▒▓▓▓███░░░█▌
            ▐░▒▒▒▌   ▐░▒▒▒▀▀▀ ▒▓░░▌   ▒▓▓▓▀██▀▀▓▓▓░▒   ▐░▒▒▒▀▀▀▓▒▒▒▓
            ▐░░░░▌   ▐░░░░█   ▄▓▓▓▓█   ░░▒▒▌▐▓ ▐░░░█░   ▐░░░░   ▀▀██▀ 
            ▀▒▓▓▓▌   ▀▒▓▓▓░▄▒▓▓▓▀▀▀   ▓▓░░▒ ░ ░▓▓▓░▀   ▀▒▓▓░█░░▒▓▓▄ 
            ▐▒▒▒▒▌   ▐▒▒▒▒▌▀▀▓▓▄▄     ░░▓▓▓   ░▒▒▒░▌   ▐▒▒▒▒▄  ▄▒▓▓▓
            ▐░░░░░   ▐░░░░░   ▀░░░░░   ▓ ░░░   ▒░░░░    ▐░░░░░░░░░░░▀
    " | lolcat
    echo "⚡ Arch Linux Environment :: Stay Creative" | lolcat
    echo ""
end

# === Safe bass wrapper & script runner ===
function __fish_bass
    set -l bass_path (type -p bass 2>/dev/null | grep -v "/usr/bin/bass" | head -n1)
    if test -z "$bass_path"
        echo "Error: bass plugin not found. Run: fisher install jorgebucaran/bass"
        return 1
    end
    eval "$bass_path $argv"
end

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

# === Workflow & Git Functions ===
function clone
    set -l target_dir "$HOME/Downloads/newfile"
    mkdir -p $target_dir
    cd $target_dir

    if test (count $argv) -eq 0
        echo "Usage: clone <repo-url>"
        return 1
    end

    if git clone $argv
        set -l repo_name (basename (string replace -r '\.git/?$' '' $argv[1]))
        if test -d "$repo_name"
            cd "$repo_name"
            ls
        end
    end
end

function gcb
    set -l branch master
    read -P "Enter GitHub repository link: " repo_link
    read -P "Enter target directory name: " dir_name
    if test -n "$argv[2]"
        set branch $argv[2]
    end
    git clone --branch $branch $repo_link $dir_name
end

# === GitHub Auth & Remote Helpers ===
# نکته: توکن اصلی خود را به جای YOUR_TOKEN قرار دهید
set -gx GITHUB_USER "Irmb7108"
if not set -q GITHUB_TOKEN
    set -gx GITHUB_TOKEN "YOUR_TOKEN"
end

function git-link
    if test (count $argv) -eq 0
        echo "Usage: git-link <repo-name>"
        return 1
    end
    git remote add origin "https://$GITHUB_USER:$GITHUB_TOKEN@github.com/$GITHUB_USER/$argv[1].git"
    echo "Linked to https://github.com/$GITHUB_USER/$argv[1].git with token!"
end

function gpush
    git add .
    set -l msg "update"
    if test (count $argv) -gt 0
        set msg "$argv"
    end
    git commit -m "$msg"
    git push -u origin (git branch --show-current)
end
