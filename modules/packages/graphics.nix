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
}