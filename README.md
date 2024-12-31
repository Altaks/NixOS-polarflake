# Polarflake

Polarflake is a NixOS configuration dedicated to computer learning. This configuration was created specifically for the IUT in La Rochelle, France. 

It provides all the tools, software, services and systems needed to follow the FullStack Developer course without missing a single tool.

The aim of this NixOS configuration is to provide new students with a Linux configuration that is quick and easy to install, so that they are ready for the next three years.

### Why [NixOS](https://nixos.org/) ?

NixOS is an operating system based on the [Nix](https://github.com/NixOS/nix) package manager, it provides a way for a user to describe it's system's configuration declarativly and avoid long hours of diving into obscure linux commands to copy a Linux configuration from one computer to another

More information about this here : [Nix & NixOS](https://nixos.org/)

## Configuration contents

This NixOS configuration provides to following content to the user's system :

- Programming tools for C, C++, Java, JavaScript, TypeScript, Flutter/Dart, Rust, Swift, Python, associated debugging tools & Jetbrains IDEs
- Math related tools (Scilab, Geogebra 6, ZeGrapher)
- SysAdmin utilities (compression, Network sniffers, partitions managers, SSH clients, Taskfiles, Justfiles, Git, GitHub CLI, etc...)
- Developer UI/UX software (Figma, GIMP, Krita)
- Bootloader configuration (GRUB 2, Grub themes, Encrypted partitions support)
- Nerd fonts
- Network, Firewall configuration, Linux Hotspot
- Virtualization systems (Docker, Podman, VirtualBox, Vagrant, Libvirtd)
- Gnome configuration w/ extensions
- Terminal config & utils (OhMyPosh, FZF, Fastfetch & zoxide)
- Team work tools (Teams, Slack, Discord, etc...)

> [!TIP]
> This configuration is set to apply the `fr_FR` configuration both for the keyboard & the system's language. You can change it in the `modules/locales.nix` file before installing the configuration.

> [!WARNING]  
> This configuration has been created for laptops with an Nvidia GeForce RTX card, for AMD graphics cards users, please refer to the [NixOS Wiki page](https://nixos.wiki/wiki/AMD_GPU). Feel free to provide a PR for a `graphics/amd` git branch created from the `main` branch.
>
> You can check whether or not OpenGL works normally by launching Minetest/Minecraft (Prism Launcher) or by using the `glxinfo` tool

## Installation

To install this configuration, you first need to [install NixOS yourself](https://nixos.org/download/#nixos-iso), then install this configuration using a simple command : 

```sh
nix run nixpkgs#git -- clone https://github.com/Altaks/NixOS-polarflake && cd NixOS-polarflake && ./install.sh 
```

## Sources

Official sources : 
- NixOS packages registry : https://search.nixos.org/packages
- NixOS options registry : https://search.nixos.org/options
- NixOS Wiki : https://nixos.wiki/

Community managed sources : 
- HomeManager options registry : https://home-manager-options.extranix.com/?query=&release=release-24.11
- NixOS community hardware config collection : https://github.com/NixOS/nixos-hardware 

## Contribution

![Alt](https://repobeats.axiom.co/api/embed/6bda1571fb29ed10c7c7649dc5850f8998ade80d.svg "Repobeats analytics image")

#### Contributing

In order to contribute to this project, you can fork the project and create pull request against the main repository.

Keep in mind that this configuration is dedicated to computer science learning, and doesn't want any user-specific configuration.

## License

This project is licensed under the [MIT License](LICENSE)