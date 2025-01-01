# :snowflake: Polarflake 

Polarflake is a NixOS configuration dedicated to computer learning. This configuration was created specifically for the IUT in La Rochelle, France. 

It provides all the tools, software, services and systems needed to follow the FullStack Developer course without missing a single tool.

The aim of this NixOS configuration is to provide new students with a Linux configuration that is quick and easy to install, so that they are ready for the next three years.

### Why [NixOS](https://nixos.org/) ?

NixOS is an operating system based on the [Nix](https://github.com/NixOS/nix) package manager, it provides a way for a user to describe it's system's configuration declarativly and avoid long hours of diving into obscure linux commands to copy a Linux configuration from one computer to another

More information about this here : [:snowflake: Nix & NixOS :snowflake:](https://nixos.org/)

## Configuration contents

This NixOS configuration provides to following content to the user's system :

- :hammer_and_wrench: Programming tools for C, C++, Java, JavaScript, TypeScript, Flutter/Dart, Rust, Swift, Python, associated debugging tools & Jetbrains IDEs
- :chart_with_upwards_trend: Math related tools (Scilab, Geogebra 6, ZeGrapher)
- :toolbox: SysAdmin utilities (compression, Network sniffers, partitions managers, SSH clients, Taskfiles, Justfiles, Git, GitHub CLI, etc...)
- :paintbrush: Developer UI/UX software (Figma, GIMP, Krita)
- :rocket: Bootloader configuration (GRUB 2, Grub themes, Encrypted partitions support)
- :space_invader: Nerd fonts
- :shield: Network, Firewall configuration, Linux Hotspot
- :electric_plug: Virtualization systems (Docker, Podman, VirtualBox, Vagrant, Libvirtd)
- :desktop_computer: Gnome configuration w/ extensions
- :floppy_disk: Terminal config & utils (OhMyPosh, FZF, Fastfetch & zoxide)
- :bust_in_silhouette: Team work tools (Teams, Slack, Discord, etc...)

> [!TIP]
> This configuration is set to apply the :fr: `fr_FR` configuration both for the keyboard & the system's language. You can change it in the `modules/locales.nix` file before installing the configuration.

> [!WARNING]  
> This configuration has been created for laptops with an Nvidia GeForce RTX card, for AMD graphics cards users, please refer to the [NixOS Wiki page](https://nixos.wiki/wiki/AMD_GPU). Feel free to provide a PR for a `graphics/amd` git branch created from the `main` branch.
>
> You can check whether or not OpenGL works normally by launching Minetest/Minecraft (Prism Launcher) or by using the `glxinfo` tool

## Installation

To install this configuration, you first need to [install NixOS yourself](https://nixos.org/download/#nixos-iso), then install this configuration using a simple command : 

```sh
nix run nixpkgs#git -- clone https://github.com/Altaks/NixOS-polarflake && cd NixOS-polarflake && ./install.sh 
```

> [!CAUTION]
> Once the script ends, you've installed the configuration, the last thing you need to do is to **reboot** your system, using the `sudo reboot now` command or the UI.

> [!IMPORTANT]
>
> #### Updates :
> Once you've installed the configuration, you won't get updates without re-executing the `./install.sh` script. The system will create a new generation providing newer versions of the software and use them instead of the previously installed versions.
>
> If you want the updated version of this configuration and not only the software within it, simply `git pull` in this folder and you'll be able to fetch the new configuration if there's any new content
>
> #### Removing previous generations : 
> During a system rebuild, NixOS keeps the old configuration in a generation, that stays on your PC until you tell the OS to remove the fallback generations. These generation take up a lot of storage capacity, because there are copies/duplicates of the same software libraries etc...
>   
> You can earn your storage back in four different ways :
> 
> - The main way is using the `sudo nixos-collect-garbage` command that will delete every generation and requires you to rebuild your system once it's finished. You can rebuild it using the `./install.sh` script or the `sudo nixos-rebuild switch` command. [*(Source)*](https://releases.nixos.org/nix/nix-2.22.3/manual/command-ref/nix-collect-garbage.html)
>
> - The next most used way is to use the `nix-store --optimise` command, which will create internal symlinks in the `/nix/store` folder, that stores every software installed on your system. It removes duplicates and keeps only one instance of a software version. [*(Source)*](https://releases.nixos.org/nix/nix-2.22.3/manual/command-ref/nix-store/optimise.html)
>
> - Modifying this project [`configuration.nix`](./configuration.nix) and adding the following : `nix.settings.auto-optimise-store = true;` to the file which will make NixOS optimize the store during the system rebuild. Then reinstall the configuration and reboot. [*(Source)*](https://nixos.wiki/wiki/Storage_optimization)
>
> - Modifying this project [`configuration.nix`](./configuration.nix) and adding the following `nix.optimise.automatic = true;` which will make NixOS optimize the Nix store during uptime. Then reinstall the configuration and reboot. [*(Source)*](https://nixos.wiki/wiki/Storage_optimization)

## Sources

Official sources : 
- :snowflake: NixOS packages registry : https://search.nixos.org/packages
- :snowflake: NixOS options registry : https://search.nixos.org/options
- :snowflake: NixOS Wiki : https://nixos.wiki/

Community managed sources : 
- :house: HomeManager options registry : https://home-manager-options.extranix.com/?query=&release=release-24.11
- :snowflake: NixOS community hardware config collection : https://github.com/NixOS/nixos-hardware 

## Contributions

![Alt](https://repobeats.axiom.co/api/embed/6bda1571fb29ed10c7c7649dc5850f8998ade80d.svg "Repobeats analytics image")

#### Contributing

In order to contribute to this project, you can fork the project and create pull request against the main repository.

Keep in mind that this configuration is dedicated to computer science learning, and doesn't want any user-specific configuration.

## License

This project is licensed under the [MIT License](LICENSE)
