{ config, pkgs, lib, ... } : {

  # Configures the bootloader
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
    };

    # Use GRUB 2 as the bootloader
    grub = {

      # Enable UEFI support
      efiSupport = true;

      device = "nodev";
      
      # Allows to detect other OSes (dual and multiboot)
      useOSProber = true;

      # Allow to detect encrypted partitions (such as btrfs and LUKS partitions)
      enableCryptodisk = true;

      # Configure the grub theme
      theme = "/home/%%%username%%%/.dotfiles/grub-theme";
      enable = true;

      # Add custom entries : 
      # - Direct BIOS/UEFI access
      # - Instant shutdown
      # - Instant restart
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

  # Sync time between the computer OSes and avoid the +1h/+2h offset
  time.hardwareClockInLocalTime = true;
}