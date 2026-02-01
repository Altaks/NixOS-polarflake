{ inputs, config, lib, pkgs, ... }: { 

  environment.systemPackages = with pkgs; [
      # Terminal editors
      vim
      nano

      # Zed editor - https://zed.dev/
      zed-editor

      # VSCodium (Open Source Visual Studio Code) with preinstalled extensions - https://vscodium.com/
      (vscode-with-extensions.override {
        vscode = vscodium;
        vscodeExtensions = with vscode-extensions; [
          
          # Nix support
          bbenoist.nix

          # Catpuccin Theme
          catppuccin.catppuccin-vsc-icons
          catppuccin.catppuccin-vsc

          # Justfiles
          skellock.just

          # Open PDFs
          tomoki1207.pdf

          # Markdown
          yzhang.markdown-all-in-one
          
          # Flutter support
          dart-code.flutter
          alexisvt.flutter-snippets

          # Error lens
          usernamehw.errorlens

          # Deno support
          denoland.vscode-deno

          # Kubernetes
          ms-kubernetes-tools.vscode-kubernetes-tools
          redhat.vscode-yaml
          redhat.vscode-xml

          # Docker
          ms-azuretools.vscode-docker

          # Paths intellisense
          christian-kohler.path-intellisense

          # Rust support
          rust-lang.rust-analyzer
        ];
      })

      # Jetbrains Tools - https://www.jetbrains.com/
      jetbrains.clion                 # C++
      jetbrains.webstorm              # JS TS 
      jetbrains.phpstorm              # PHP
      jetbrains.rust-rover            # Rust
      jetbrains.pycharm               # Python
      jetbrains.idea                  # Java, Kotlin
      jetbrains.datagrip              # Database viewer/ide

      # Qt Creator - https://doc.qt.io/qtcreator/creator-overview.html
      qtcreator
      libsForQt5.qt5.qtmultimedia
      libsForQt5.qt5.qttools
      libsForQt5.qt5.qtbase

      # Libre Office suite - https://www.libreoffice.org/
      libreoffice
  ];
}