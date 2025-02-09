{ inputs, config, lib, pkgs, ... }: { 

  environment.systemPackages = with pkgs; [
    obsidian            # Obsidian - https://obsidian.md/
    appflowy            # AppFlowy - https://appflowy.io/
    affine              # AFFiNE   - https://affine.pro/
  ];
}