{ inputs, config, lib, pkgs, ... }: { 

  environment.systemPackages = with pkgs; [
    obsidian
    appflowy
    notion-app-enhanced
  ];
}