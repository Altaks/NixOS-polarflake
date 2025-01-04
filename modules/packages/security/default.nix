{ config, pkgs, lib, ... } : {

  imports = [
    ./browsing.nix
    ./passwords.nix
    ./vpn.nix
  ];

}