{ config, pkgs, lib, ... } : {

  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
    };
    grub = {
      efiSupport = true;
      device = "nodev";
      useOSProber = true;
      enableCryptodisk = true;
      theme = "/home/%%%username%%%/.dotfiles/grub-theme";
      enable = true;
      extraEntries = ''
      menuentry "BIOS / UEFI (Motherboard configuration)" {
        fwsetup
      }

      menuentry "Shutdown" {
        insmod halt
        halt
      }

      menuentry "Restart" {
        insmod reboot
        reboot
      }
      '';
    };
  };

  time.hardwareClockInLocalTime = true;
}