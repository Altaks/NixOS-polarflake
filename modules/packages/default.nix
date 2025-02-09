{ config, pkgs, lib, ... } : {

  imports = [
    ./devops
    ./maths
    ./programming
    ./security
    ./sysadmin
    ./ui-ux

    ./editors.nix
    ./media.nix
    ./nix-utilities.nix
    ./notes.nix
    ./team-work.nix
    ./utils.nix
    ./web.nix
    ./xdg.nix
    ./yubikey.nix
  ];

}