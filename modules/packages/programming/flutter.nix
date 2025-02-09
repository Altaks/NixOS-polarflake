{ inputs, config, lib, pkgs, ... }: { 

  environment.systemPackages = with pkgs; [
    # Flutter & Dart development - https://flutter.dev/
    inputs.nixpkgs-unstable.legacyPackages."${pkgs.system}".flutter
    dart
  ];
}