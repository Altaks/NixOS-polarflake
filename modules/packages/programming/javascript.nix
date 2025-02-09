{ inputs, config, lib, pkgs, ... }: { 

  environment.systemPackages = with pkgs; [
      # NodeJS 22 - https://nodejs.org/en
      nodejs_22 

      # Deno - https://deno.com/
      deno

      # TypeScript - https://www.typescriptlang.org/
      typescript
  ];
}