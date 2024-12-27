{ inputs, config, lib, pkgs, ... }: { 

  environment.systemPackages = with pkgs; [
    zulu
    zulu17
  ];
}