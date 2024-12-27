{ inputs, config, lib, pkgs, ... }: { 

  environment.systemPackages = with pkgs; [
    # Flutter & Dart development
    flutter
    dart
  ];
}