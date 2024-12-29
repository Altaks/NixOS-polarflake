{ inputs, config, lib, pkgs, ... }: { 

  # UI/UX design
  environment.systemPackages = with pkgs; [
    figma-linux         # Figma - https://www.figma.com/
    gimp-with-plugins   # GIMP  - https://www.gimp.org/
    krita               # Krita - https://krita.org/en/
  ];
}