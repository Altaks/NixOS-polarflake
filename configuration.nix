# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ inputs, config, lib, pkgs, ... }:

{
  imports = [ 
    
    inputs.home-manager.nixosModules.default
    
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./modules
  ];

  # Define Home Manager configuration entry
  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    users = {
      "%%%username%%%" = import ./home-manager/home.nix;
    };
  };
  
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;
  services.xserver.desktopManager.gnome.extraGSettingsOverrides = ''
    [org.gnome.desktop.peripherals.touchpad]
    click-method='default'
  '';

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.%%%username%%% = {
    isNormalUser = true;
    description = "%%%username%%%";
    extraGroups = [ "networkmanager" "wheel" "docker" "kvm" "adbusers" "qemu-libvirtd" "libvirtd" ];
    packages = with pkgs; [];
  };

  users.extraGroups.vboxusers.members = [ "%%%username%%%" ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    nano
  ];

  # Allow unfree packages & flakes
  nixpkgs.config.allowUnfree = true;

  # Configure Nix system
  nix.settings = {
    # Optimise store during rebuilds
    auto-optimise-store = true;

    # Allow experimental features to work
    experimental-features = [ "nix-command" "flakes" ];
  };

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "25.05"; # Did you read the comment?

}

