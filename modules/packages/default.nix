{ config, pkgs, lib, ... } : {

  imports = [
    ./programming
    ./ui-ux
    ./sysadmin
    ./devops

    ./editors.nix
    ./graphics.nix
    ./media.nix
    ./nix-utilities.nix
    ./notes.nix
    ./team-work.nix
    ./utils.nix
    ./vpn.nix
    ./web.nix
    ./yubikey.nix
  ];

}