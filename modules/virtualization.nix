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
  };

  programs.virt-manager.enable = true;

  # Nvidia GPU passthrough
  hardware.nvidia-container-toolkit.enable = true;

  environment.systemPackages = with pkgs; [
    qemu_full
  ];

}