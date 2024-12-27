{ inputs, config, lib, pkgs, ... }: { 

  environment.systemPackages = with pkgs; [
    eog
    ghex
    enter-tex
    gnome-graphs

    errands # Post-its
    dialect # Translation
    hieroglyphic # Find LaTeX symbols
    inputs.nixpkgs-unstable.legacyPackages."${pkgs.system}".gaphor # UML Modeling
    lorem # Generate "Lorem Ipsums"
    metadata-cleaner # Clean file EXIF like data
    eyedropper # Color picker
    textpieces # Quick text processing
    wike # Open Wikipedia pages from app
    switcheroo # Convert images from format to format
    forge-sparks # Get git forges notifications when logged in
    elastic # Generate animations
    collision # Check hashes
  ];
}