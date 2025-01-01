{ config, pkgs, lib, ... } : {

  # Configures the bootloader
  boot.loader = {

    # UEFI configuration
    efi = {
      # Allow the bootloader installation process to modify the EFI variables
      canTouchEfiVariables = true;
    };

    # Set the GRUB timeout to 10 seconds
    timeout = 10;

    # Use GRUB 2 as the bootloader
    grub = {

      # Enable GRUB 2
      enable = true;

      # Enable UEFI support
      efiSupport = true;

      # Generates the GRUB menu but doesn't install GRUB related commands on the system
      device = "nodev";
      
      # Allows to detect other OSes (dual and multiboot)
      useOSProber = true;

      # Make it boot by default in the latest boot entry
      default = "saved";

      # Allow to detect encrypted partitions (such as btrfs and LUKS partitions)
      enableCryptodisk = true;

      # Enable memtest86 to allow RAM testing
      memtest86.enable = true;

      # Configure the grub theme
      theme = "/home/%%%username%%%/.dotfiles/grub-theme";

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