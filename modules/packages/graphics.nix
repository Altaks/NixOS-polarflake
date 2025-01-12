{ inputs, config, lib, pkgs, ... }: { 

  environment.systemPackages = with pkgs; [
    # GPU Information viewer - https://github.com/arunsivaramanneo/GPU-Viewer
    gpu-viewer

    # Graphics related tools https://wiki.nixos.org/wiki/Graphics
    glxinfo
    vulkan-tools
    clinfo
    libva-utils
    vdpauinfo
  ];

  # OpenGL configuration - https://nixos.wiki/wiki/OpenGL
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "amdgpu" "modesetting" ];

  # AMD GPU related configuration
  hardware.amdgpu = {
    opencl.enable = true;
    initrd.enable = true;
    amdvlk = {
      enable = true;
      support32Bit.enable = true;
    };
  };
}