{ inputs, config, lib, pkgs, ... }: { 

  environment.systemPackages = with pkgs; [
    k9s
    kubectl
    kubeshark
    lens
  ];
}