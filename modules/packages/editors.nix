{ inputs, config, lib, pkgs, ... }: { 

  environment.systemPackages = with pkgs; [
      # Terminal editors
      vim
      nano

      # Zed editor
      inputs.nixpkgs-unstable.legacyPackages."${pkgs.system}".zed-editor

      (vscode-with-extensions.override {
        vscode = vscodium;
        vscodeExtensions = with vscode-extensions; [
          
          # Nix support
          bbenoist.nix

          # Catpuccin Theme
          catppuccin.catppuccin-vsc-icons
          catppuccin.catppuccin-vsc

          # Open PDFs
          tomoki1207.pdf

          yzhang.markdown-all-in-one
          vscjava.vscode-gradle

          dart-code.flutter
          alexisvt.flutter-snippets

          usernamehw.errorlens

          denoland.vscode-deno
        ];
      })

    
      # Jetbrains Tools
      jetbrains.clion                 # C++
      jetbrains.webstorm              # JS TS 
      jetbrains.phpstorm              # PHP
      jetbrains.rust-rover            # Rust
      jetbrains.pycharm-professional  # Python
      jetbrains.idea-ultimate         # Java, Kotlin
      jetbrains.datagrip              # Database viewer/ide

      # Qt Creator
      qtcreator
      libsForQt5.full

      # Libre Office suite
      libreoffice
  ];
}