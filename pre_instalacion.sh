#!/bin/bash

set -e

echo "[+] Actualizando sistema..."
sudo pacman -Syu --noconfirm

echo "[+] Instalando herramientas base..."
sudo pacman -S --needed --noconfirm \
    base-devel \
    git \
    openssh \
    networkmanager \
    xorg-server \
    xorg-xinit \
    xorg-xrandr \
    xterm \
    libx11 \
    libxft \
    libxinerama \
    freetype2 \
    fontconfig \
    mesa \
    libglvnd \
    ttf-ubuntu-font-family \
    dmenu \
    st

echo "[+] Habilitando servicios..."
sudo systemctl enable NetworkManager
sudo systemctl enable sshd

echo "[+] Configurando .xinitrc..."
echo "exec /usr/local/bin/dwm" > ~/.xinitrc

echo "[+] =========================================="
echo "[+] Instalacion base completada"
echo "[+] Ahora compila e instala dwm manualmente:"
echo
echo "    git clone https://git.suckless.org/dwm"
echo "    cd dwm"
echo "    sudo make clean install"
echo
echo "[+] Luego inicia con:"
echo
echo "    startx"
echo "[+] =========================================="

#################################################
# OPCIONAL - INTEL
#################################################

: '
Si usas Intel puedes instalar adicionalmente:

sudo pacman -S --needed \
    vulkan-intel

IMPORTANTE:
NO instalar xf86-video-intel
En hardware moderno es mejor usar modesetting.
'
