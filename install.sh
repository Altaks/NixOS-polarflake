#!/bin/sh

# Backup of existing configuration with timestamp
echo "Backing up existing generation configuration files... "
mkdir -p /etc/nixos_backups/
sudo tar -Jcvf /etc/nixos_backups/backup_$(date +%Y%m%d_%H%M%S).tar.xz /etc/nixos/

# Clearing the NixOS configuration folder
sudo rm -rf /etc/nixos/*

# Regenerate the Hardware configuration & user related configuration
sudo nixos-generate-config

# Copy every file here in the configuration folder & reapply permissions
sudo cp -r ./* /etc/nixos/
sudo chown root:root -R /etc/nixos

# If configuration files exist already, back them up, otherwise just copy them
if [[ ! -d $HOME/.dotfiles ]]; then
    mkdir -p $HOME/.dotfiles
    cp -r ./dotfiles/* $HOME/.dotfiles/
else
    mkdir -p $HOME/.dotfiles_backups
    sudo tar -Jcvf $HOME/.dotfiles_backups/backup_$(date +%Y%m%d_%H%M%S).tar.xz $HOME/.dotfiles/
    rm -rf $HOME/.dotfiles
    mkdir -p $HOME/.dotfiles
    cp -r ./dotfiles/* $HOME/.dotfiles
fi

# Deleting existing mimeapps mappings
sudo rm -r $HOME/.config/gtk-* $HOME/.config/mimeapps.list

# Start the generation switch
sudo nixos-rebuild switch --upgrade-all