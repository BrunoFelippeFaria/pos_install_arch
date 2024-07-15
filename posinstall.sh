#!/usr/bin/bash

#cores
VERMELHO='\e[1;91m'
VERDE='\e[1;92m'
SEM_COR='\e[0m'

#Funções

parar(){
	pkill -9 -f posinstall.sh
}

#======================================TESTES E REQUISITOS=====================================================================

# Detectar internet

testes_internet(){
if ! ping -c 1 8.8.8.8 -q &> /dev/null; then
	echo -e "${VERMELHO}[ERROR] - Seu computador não está conectado a internet ${SEM_COR}"
	parar
fi
}

#========================================INSTALAÇÃOPACMAN===========================================================

apps_para_instalar=(
	mpv
	git
	wget
	translate-shell
	htop
	go
	neofetch
	fastfetch
	feh
	ranger
	python3
	python-pip
	python-pipx
	curl
	dolphin
	konsole
	firefox
	kate
	neovim
	flatpak
	bluez
	bluez-utils
	gufw
)

instalar_pacman(){
echo -e "Instalando pacotes"

for programa in ${apps_para_instalar[@]}; do
  if ! pacman -Qs $programa > /dev/null; then
		sudo pacman -S --noconfirm $programa
  else
		echo -e "${VERDE} $programa já está instalado ${SEM_COR}"
  fi
done
}

#===================================INSTALAÇÃO FLATPAKS======================================================================

flatpaks_para_instalar=(
	io.appflowy.AppFlowy
	com.rtosta.zapzap
)

instalar_flatpaks(){
for flat in ${flatpaks_para_instalar[@]}; do
	if ! flatpak list --app | grep -q $flat; then
		flatpak install flathub $flat -y
	else
		echo "$flat já está instalado"
	fi
done
}

#===========================================INSTALAÇÃO PIPX=================================================================

pipx_para_instalar=(
	yewtube
	Trackma
)
instalar_pipx(){
for p in ${pipx_para_instalar[@]}; do
	if ! pipx list | grep -q $p; then
		pipx install $p
	fi
done
}

#===================================Instalação yay=================================================
instalar_yay(){
	git clone https://aur.archlinux.org/yay.git
	cd yay
	makepkg --noconfirm -si
	cd ..
}

aur_para_instalar=(
	tgpt
	goanime
	vscodium-bin
)

instalar_aur(){
for y in ${aur_para_instalar[@]}; do
  if ! yay -Qs $y > /dev/null; then
		sudo pacman -S --noconfirm $y
  else
		echo -e "${VERDE} $y já está instalado ${SEM_COR}"
  fi
done
}

#================================CONFIGURAÇÕES 		EXTRAS=========================================================================

ativar_bluetooth(){
	echo "ativando bluetooth"
	sudo systemctl enable bluetooth.service
	sudo systemctl start bluetooth.service
}

ativar_firewall(){
	echo "ativando firewall"
    sudo systemctl enable ufw
	echo "para que o firewall funcione, é necessario que você reinicie o sistema"
}

#============================================================Finalização==========================================

finalizar(){
	sudo pacman -Syu --noconfirm
	sudo pacman -Sc --noconfirm
}


#------------------------------------------------------------------------------------------------------------------------------
#-----------------------------------executar

testes_internet
instalar_pacman
instalar_flatpaks
instalar_pipx
instalar_yay
instalar_aur
ativar_bluetooth
ativar_firewall
finalizar

echo "pos instalação concluida! não se esqueça de baixar o microcode do seu processador"