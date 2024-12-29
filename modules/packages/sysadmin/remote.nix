{ inputs, config, lib, pkgs, ... }: { 

  environment.systemPackages = with pkgs; [
    termius    # Termius   - https://termius.com/
    filezilla  # FileZilla - https://filezilla-project.org/
  ];
}