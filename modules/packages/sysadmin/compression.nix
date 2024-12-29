{ inputs, config, lib, pkgs, ... }: { 

  environment.systemPackages = with pkgs; [

    # Better compression tools
    p7zip

    # Zip & Unzip tools
    zip
    unzip
  ];
}