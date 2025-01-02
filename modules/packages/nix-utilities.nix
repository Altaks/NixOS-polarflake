{ inputs, config, lib, pkgs, ... }: { 

  environment.systemPackages = with pkgs; [
    # Nix Health checker
    nix-health            # Nix Health Checker
    nix-output-monitor    # NixOS rebuild pretty display

    # Dconf to Nix converter
    dconf2nix

    # Graphical system config tools
    inputs.nix-software-center.packages.${system}.nix-software-center # Snap equivalent for NixOS  - https://github.com/snowfallorg/nix-software-center
    inputs.nixos-conf-editor.packages.${system}.nixos-conf-editor     # NixOS configuration editor - https://github.com/snowfallorg/nixos-conf-editor
  ];
}