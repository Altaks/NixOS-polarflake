{ config, pkgs, lib, ... } : {

  imports = [
    ./backups.nix
    ./compression.nix
    ./flashing.nix
    ./network-utils.nix
    ./partitions.nix
    ./performance.nix
    ./remote.nix
    ./scripting.nix
    ./system-health.nix
    ./version-control.nix
  ];

}