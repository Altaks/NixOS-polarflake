{
  description = "NixOS Polarflake configurations manifest";

  # Packages providers list
  inputs = {

    # NixOS packages from stable 24.11 and unstable
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home Manager for NixOS 24.11
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Nix community flakes 
    nixos-conf-editor.url = "github:snowfallorg/nixos-conf-editor";
    nix-software-center.url = "github:snowfallorg/nix-software-center";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };

  outputs = { self, nixpkgs, nixos-hardware, ... } @ inputs: 
    let
      inherit (self) outputs;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      forAllSystems = nixpkgs.lib.genAttrs [
        "aarch64-linux"
        "i686-linux"
        "x86_64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ];
    in rec
    {
      nixosConfigurations = {
        
        base = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs;
          };
          modules = [
            ./configuration.nix
          ];
        };

        nvidia-stable = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs;
          };
          modules = [
            ./configuration.nix
            ./modules/drivers/gpu/nvidia/nvidia-stable.nix
          ];
        };

        nvidia-legacy-340 = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs;
          };
          modules = [
            ./configuration.nix
            ./modules/drivers/gpu/nvidia/nvidia-legacy-340.nix
          ];
        };

        nvidia-legacy-390 = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs;
          };
          modules = [
            ./configuration.nix
            ./modules/drivers/gpu/nvidia/nvidia-legacy-390.nix
          ];
        };

        nvidia-legacy-470 = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs;
          };
          modules = [
            ./configuration.nix
            ./modules/drivers/gpu/nvidia/nvidia-legacy-470.nix
          ];
        };

        amd-stable = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs;
          };
          modules = [
            ./configuration.nix
            ./modules/drivers/gpu/amd/amd-stable.nix
          ];
        };

        amd-legacy = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs;
          };
          modules = [
            ./configuration.nix
            ./modules/drivers/gpu/amd/amd-legacy-si-cik.nix
          ];
        };

        intel = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs;
          };
          modules = [
            ./configuration.nix
            ./modules/drivers/gpu/intel/intel-stable.nix
          ];
        };

      };
    };
}