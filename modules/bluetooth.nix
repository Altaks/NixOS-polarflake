{ config, pkgs, lib, ... } : {

  # Bluetooth configuration
  hardware.bluetooth.enable = true;

  # Make sure the bluetooth starts on boot
  hardware.bluetooth.powerOnBoot = true;
  
  # Enable blueman in order to manage bluetooth.
  services.blueman.enable = true;
  
}