{ inputs, config, lib, pkgs, ... }: { 

  environment.systemPackages = with pkgs; [
    # Flutter & Dart development - https://flutter.dev/
    flutter
    dart
  ];
}