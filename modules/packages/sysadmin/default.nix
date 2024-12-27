{ config, pkgs, lib, ... } : {

  imports = [
    ./compression.nix
    ./flashing.nix
    ./network-utils.nix
    ./partitions.nix
    ./performance.nix
    ./remote.nix
    ./system-health.nix
    ./version-control.nix
  ];

}