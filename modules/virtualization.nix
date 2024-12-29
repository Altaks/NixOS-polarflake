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
    vagrant
  ];

  # Minimal configuration for NFS support with Vagrant.
  services.nfs.server.enable = true;
  
  # Add firewall exception for VirtualBox provider 
  networking.firewall.extraCommands = ''
    ip46tables -I INPUT 1 -i vboxnet+ -p tcp -m tcp --dport 2049 -j ACCEPT
  '';

  # Add firewall exception for libvirt provider when using NFSv4 
  networking.firewall.interfaces."virbr1" = {                                   
    allowedTCPPorts = [ 2049 ];                                               
    allowedUDPPorts = [ 2049 ];                                               
  };

}