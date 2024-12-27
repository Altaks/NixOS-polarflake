{ inputs, config, lib, pkgs, ... }: { 

  environment.systemPackages = with pkgs; [
    platformio-core
    platformio
  ];
}