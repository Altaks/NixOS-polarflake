{ inputs, config, lib, pkgs, ... }: { 

  environment.systemPackages = with pkgs; [
      # NodeJS 22 - https://nodejs.org/en
      nodejs_22 

      # Deno - https://deno.com/
      inputs.nixpkgs-unstable.legacyPackages."${pkgs.system}".deno
  ];
}