{ inputs, config, lib, pkgs, ... }: { 

  # Install a bunch of nice tools for GNOME - https://apps.gnome.org/en/
  environment.systemPackages = with pkgs; [
    eog
    ghex
    enter-tex
    setzer
    texliveSmall
    gnome-graphs

    errands                                                        # Post-its
    dialect                                                        # Translation
    hieroglyphic                                                   # Find LaTeX symbols
    gaphor                                                         # UML Modeling
    lorem                                                          # Generate "Lorem Ipsums"
    metadata-cleaner                                               # Clean file EXIF like data
    eyedropper                                                     # Color picker
    textpieces                                                     # Quick text processing
    wike                                                           # Open Wikipedia pages from app
    switcheroo                                                     # Convert images from format to format
    forge-sparks                                                   # Get git forges notifications when logged in
    elastic                                                        # Generate animations
    collision                                                      # Check hashes

    tldr                                                           # TLDR pages  - https://tldr.sh/
  ];
}