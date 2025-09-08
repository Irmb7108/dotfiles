<p align="center">
  <img src="https://github.com/Irmb7108/filed/blob/main/dotfiles-logo.svg" width="512">
</p>

<h1 align="center">IR-MB's Dotfiles</h1>
<p align="center">
  My personal dotfiles for a customized Arch Linux setup with a sleek and productive environment.
</p>

<p align="center">
  <a href="https://github.com/Irmb7108/dotfiles"><img src="https://img.shields.io/github/stars/Irmb7108/dotfiles?style=social" alt="GitHub Stars"></a>
  <a href="https://github.com/Irmb7108/dotfiles/blob/main/LICENSE"><img src="https://img.shields.io/github/license/Irmb7108/dotfiles" alt="License"></a>
</p>

---

## 📋 Overview

This repository contains my personal dotfiles for configuring a customized Arch Linux desktop environment. It includes configurations for tools like bspwm, zsh, fish, neovim, rofi, and more, along with a script to automate installation, backup existing configs, and set up dependencies. The setup is designed to be lightweight, modern, and highly customizable.

### ✨ Features
- Window Manager: BSPWM with Polybar and SXHKD for a minimal and efficient desktop.
- Shell: Zsh and Fish with custom themes (Starship prompt).
- Editor: Neovim with LunarVim and custom configurations.
- Tools: Rofi, Alacritty, Kitty, Eww, MPD, and more.
- Fonts: SFMono Nerd Font for a clean and ligaturized look.
- Backup: Automatically backs up existing configurations to ~/.RiceBackup.
- Theming: Custom themes for KDE, Firefox, Telegram, and Spotify (via Spicetify).
- Dependencies: Installs all required packages via pacman and yay.

---

## 🛠 Prerequisites

- Operating System: Arch Linux or Arch-based distributions (e.g., Manjaro, EndeavourOS).
- Internet Connection: Required for downloading dependencies and cloning repositories.
- User Privileges: Run the script as a non-root user (root is needed for some package installations).
- Git: Must be installed (sudo pacman -S git if not present).

---

## 💾 Installation


<b>Open a terminal in HOME</b>
- First download the installer
sh
curl https://raw.githubusercontent.com/Irmb7108/dotfiles/master/RiceInstaller -o $HOME/RiceInstaller
- Now give it execute permissions
sh
chmod +x RiceInstaller
- Finally run the installer
sh
./RiceInstaller
- Telegram Desktop Themes:
👌🏻 https://t.me/addtheme/ctp_mocha
