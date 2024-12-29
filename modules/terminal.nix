{ inputs, config, lib, pkgs, ... }: { 

  environment.systemPackages = with pkgs; [

    # Allows to customize the terminal appearance - https://ohmyposh.dev/
    oh-my-posh

    # Fast file searching / Command line fuzzy finder - https://github.com/junegunn/fzf
    fzf

    # System information display tool - https://github.com/fastfetch-cli/fastfetch
    fastfetch

    # Improved cd command - https://github.com/ajeetdsouza/zoxide
    zoxide
  ];
}