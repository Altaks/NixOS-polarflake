{ inputs, config, lib, pkgs, ... }: { 

  environment.systemPackages = with pkgs; [
      # Deno
      nodejs_22 
      inputs.nixpkgs-unstable.legacyPackages."${pkgs.system}".deno
  ];
}