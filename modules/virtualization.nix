{ inputs, config, lib, pkgs, ... }: { 

  # Docker & KVM/QEMU configuration
  virtualisation = { 
    docker = {
      enable = true;
      rootless = {
        enable = true;
        setSocketVariable = true;
      };
    };
    libvirtd = {
      enable = true;
    };
    virtualbox.host = {
      enable = true;
      enableExtensionPack = true;
    };
    podman = {
      enable = true;
      defaultNetwork.settings.dns_enabled = true;
    };
    containers = {
      enable = true;
    };
  };

  programs.virt-manager.enable = true;

  # Nvidia GPU passthrough
  hardware.nvidia-container-toolkit.enable = true;

  environment.systemPackages = with pkgs; [
    qemu_full
    dive
    podman-tui
    podman-desktop
  ];

}