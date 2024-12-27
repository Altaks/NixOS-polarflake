{ inputs, config, lib, pkgs, ... }: { 

  environment.systemPackages = with pkgs; [
    oh-my-posh
    fzf
    fastfetch
    zoxide
  ];
}