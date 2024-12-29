{ inputs, config, lib, pkgs, ... }: { 

  environment.systemPackages = with pkgs; [
    # Embedded development for ESP32 and other embedded systems - https://platformio.org/
    platformio-core
    platformio
  ];
}