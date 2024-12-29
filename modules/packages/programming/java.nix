{ inputs, config, lib, pkgs, ... }: { 

  environment.systemPackages = with pkgs; [
    zulu    # Zulu 21 - https://www.azul.com/downloads/?package=jdk#zulu
    zulu17  # Zulu 17 
  ];
}