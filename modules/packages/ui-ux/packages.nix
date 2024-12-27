{ inputs, config, lib, pkgs, ... }: { 

  environment.systemPackages = with pkgs; [
    # UI/UX design
    figma-linux
    gimp-with-plugins
  ];
}