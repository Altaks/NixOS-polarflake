{ inputs, config, lib, pkgs, ... }: { 

  environment.systemPackages = with pkgs; [
    git
    lazygit
    gh
  ];
}