#!/bin/sh

# Backup of existing configuration with timestamp
echo "Backing up existing generation configuration files..."
sudo mkdir -p /etc/nixos_backups/
sudo tar -Jcvf /etc/nixos_backups/backup_$(date +%Y%m%d_%H%M%S).tar.xz /etc/nixos/ 2> /dev/null

# Clearing the NixOS configuration folder
echo "Deleting current configuration from the configuration folder..."
sudo rm -rf /etc/nixos/*

# Regenerate the Hardware configuration & user related configuration
echo "Regenerate systems hardware configuration"
sudo nixos-generate-config

# Define current username
NIX_USERNAME=$USER
NIX_HOSTNAME=$HOSTNAME

# Querying current folder where git has been cloned (git project can be cloned elsewhere than a "NixOS-polarflake" named folder)
PROJECT_FOLDER_NAME="${PWD##*/}"

# Clear existing dist folder and hide error of there are any
echo "Making sure the dist folder is empty"
sudo rm -rf ../${PROJECT_FOLDER_NAME}_dist 2> /dev/null

echo -e "Creating custom configuration with following configuration : \n  Username : $USERNAME\n  Hostname : $HOSTNAME"

# Listing every file recursively in the project except the .git folder
FILES_LIST=$(find | grep -v .git)

for path in $FILES_LIST; do

    # Detect current folder name
    CURRENT_FOLDER_NAME="${PWD##*/}"

    # Extract file path stem
    PATH_STEM=$(echo $path | awk '{sub(/^\./, "")}1')

    # Generate the new dist path for the same file
    NEW_PATH="../${PROJECT_FOLDER_NAME}_dist$PATH_STEM"

    # Extract the file folder path
    DIR_PATH=$(dirname $NEW_PATH)

    # Make sure the folder exists
    mkdir -p $DIR_PATH

    # If the file is a .nix file, then change the username and hostname flags during the copy, otherwise simply copy the file
    if [[ -n $(echo $path | grep .nix) ]]; then
        cat $path \
            | awk -v NIX_USERNAME="$NIX_USERNAME" '{sub(/%%%username%%%/, NIX_USERNAME)}1' \
            | awk -v NIX_HOSTNAME="$NIX_HOSTNAME" '{sub(/%%%hostname%%%/, NIX_HOSTNAME)}1' \
            > $NEW_PATH
    else
        cp $path $NEW_PATH 2> /dev/null
    fi
done

# Warp inside the dist folder to continue the installation
cd ../${PROJECT_FOLDER_NAME}_dist

# Copy every file here in the configuration folder & reapply permissions
echo "Copying generated configuration to /etc/nixos/ folder"
sudo cp -r ./* /etc/nixos/
sudo chown root:root -R /etc/nixos

# If configuration files exist already, back them up, otherwise just copy them
echo ".dotfiles phase"
if [[ ! -d $HOME/.dotfiles ]]; then
    echo "Creating & copying dotfiles to folder"
    mkdir -p $HOME/.dotfiles
    cp -r ./dotfiles/* $HOME/.dotfiles/
else
    echo "Creating backup of the ~/.dotfiles folder"
    mkdir -p $HOME/.dotfiles_backups
    sudo tar -Jcvf $HOME/.dotfiles_backups/backup_$(date +%Y%m%d_%H%M%S).tar.xz $HOME/.dotfiles/
    rm -rf $HOME/.dotfiles
    echo "Copying the new dotfiles to the ~/.dotfiles folder"
    mkdir -p $HOME/.dotfiles
    cp -r ./dotfiles/* $HOME/.dotfiles
fi

# Deleting existing mimeapps mappings
echo "Cleaning previous configuration misc files"
sudo rm -r $HOME/.config/gtk-* $HOME/.config/mimeapps.list

# Start the generation switch
echo "Switching current system's configuration."

if [ "$#" -ne 0 ]; then 
    sudo nixos-rebuild switch --upgrade-all --flake /etc/nixos/#$1
else 
    sudo nixos-rebuild switch --upgrade-all --flake /etc/nixos/#base
fi