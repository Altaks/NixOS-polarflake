{ inputs, config, lib, pkgs, ... }: { 

  environment.systemPackages = with pkgs; [
    gcc
    cmake
    gnumake
    ninja
  ];
}