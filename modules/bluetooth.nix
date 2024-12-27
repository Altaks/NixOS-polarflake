{ config, pkgs, lib, ... } : {

  # Bluetooth configuration
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  
  # Enable blueman in order to manage bluetooth.
  services.blueman.enable = true;
  
}