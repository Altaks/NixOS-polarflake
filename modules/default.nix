{ config, pkgs, lib, ... } : {

  imports = [
    ./packages
    
    ./audio.nix
    ./bluetooth.nix
    ./bootloader.nix
    ./fonts.nix
    ./gnome.nix
    ./locales.nix
    ./networks.nix
    ./services.nix
    ./terminal.nix
    ./virtualization.nix
  ];

}