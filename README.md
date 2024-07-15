# Script de pos instalação do arch linux

esse script faz algumas instalações e configurações no arch linux, ele foi feito para ser usado com o Kde, nada impede que ele funcione com outros DEs, porem alguns programas instalados pelo script não funcionem como o esperado.

# O que o script faz?

## 1 Instala pacotes do pacman

- mpv
- git
- wget
- translate-shell
- htop
- go
- neofetch
- fastfetch
- feh
- ranger
- python3
- python-pip
- python-pipx
- curl
- dolphin
- konsole
- firefox
- kate
- neovim
- flatpak
- bluez
- bluez-utils
- gufw

## 2 Instala flatpaks

- appflowy
- zapzap

## 3 Instala programas python com o pipx

- yewtube
- trackma

## 4 Faz a instalação do yay, e então instala alguns programas do aur

- tgpt
- goanime
- vscodium

## 5 Faz algumas configurações

- ativação do bluetooth
- ativação do firewall

após o uso do script, e necessário instalar o microcode do seu processdor, para isso abra o terminal:

para processadores da amd:

sudo pacman -S amd-ucode

para processadores da intel:

sudo pacman -S intel-ucode

e então é necessario reiniciar o sistema.