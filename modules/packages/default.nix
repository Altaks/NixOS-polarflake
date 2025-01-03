{ config, pkgs, lib, ... } : {

  imports = [
    ./programming
    ./ui-ux
    ./sysadmin
    ./devops
    ./maths

    ./editors.nix
    ./graphics.nix
    ./media.nix
    ./nix-utilities.nix
    ./notes.nix
    ./team-work.nix
    ./utils.nix
    ./vpn.nix
    ./web.nix
    ./xdg.nix
    ./yubikey.nix
  ];

}