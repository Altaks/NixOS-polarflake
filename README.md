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
> This configuration is set to apply the :fr: `fr_FR` configuration both for the keyboard & the system's language. You can change it in the [`modules/locales.nix`](/modules/locales.nix) file before installing the configuration.

> [!WARNING]
> The base configuration is installed by default if you do not provide any profile argument whilst starting the installation script. The base configuration does not provide any hardware related driver (e.g. GPU). For those who want their graphic driver to be installed right away, please refer to the following profiles list :

<table><thead>
  <tr>
    <th colspan="2">Nvidia<br></th>
    <th colspan="3">AMD</th>
  </tr></thead>
<tbody>
  <tr>
    <td colspan="2">Dedicated GPU<br></td>
    <td>Dedicated GPU</td>
    <td colspan="2">Integrated GPU</td>
  </tr>
  <tr>
    <td>Stable<br></td>
    <td><code>nvidia-stable</code></td>
    <td><em>Work in progress</em></td>
    <td>Radeon</td>
    <td><code>amd-stable</code></a></td>
  </tr>
  <tr>
    <td>Legacy driver (470)</td>
    <td><code>nvidia-legacy-470</code></a></td>
    <td></td>
    <td>Southern Island</td>
    <td><code>amd-legacy-si-cik</code></td>
  </tr>
  <tr>
    <td>Legacy driver (390)</td>
    <td><code>nvidia-legacy-390</code></td>
    <td></td>
    <td>Sea Island</td>
    <td><code>amd-legacy-si-cik</code></td>
  </tr>
  <tr>
    <td>Legacy driver (340)</td>
    <td><code>nvidia-legacy-340</code></td>
    <td></td>
    <td></td>
    <td></td>
  </tr>
</tbody>
</table>

*Nvidia users can refer to the following registry : https://www.nvidia.com/en-us/drivers/unix/legacy-gpu/ to determine whether or not their GPU is considered legacy by Nvidia*

*AMD gpu users can refer to the following links : https://en.wikipedia.org/wiki/Radeon_HD_8000_series , https://en.wikipedia.org/wiki/Radeon_HD_7000_series to determine their GPU category name*

## Installation

To install this configuration, you first need to [install NixOS yourself](https://nixos.org/download/#nixos-iso)

After that, you will need Git to clone the configuration easily. You can temporarily install it using the following command : 
```sh
nix-shell -p git
```

Then, within the freshly created shell, start installing this configuration by cloning the configuration files :

```sh
# Clone the configuration on your machine
git clone https://github.com/Altaks/NixOS-polarflake
```

After cloning the configuration, you only need to execute these commands : 

```sh
# Warp into the configuration folder
cd NixOS-polarflake

# Install the configuration
# This will ask for sudo mode access. 

# Base profile installation
./install.sh 

# OR 
# Specific profile installation, example : 
# /install.sh nvidia-stable => Installs the nvidia stable profile
./install.sh <profile> 
```

> [!CAUTION]
> Use <kbd>Ctrl</kbd> + <kbd>Z</kbd> to cancel the installation.
> If you stopped the script during the generation build/switch phase, you might encounter bugs/crashes/corrupted files.
> 
> Once the script ends, you've installed the configuration, the last thing you need to do is to **reboot** your system, using the `sudo reboot now` command or the UI.
>
> Upon rebooting your system, make sure your new first boot entry in your BIOS/UEFI is set on `NixOS boot` (which corresponds to GRUB) and not `Linux Boot Manager` (which corresponds to system-boot, the default installed bootloader which won't boot onto the right configuration)

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
> - The main way is using the `sudo nix-collect-garbage` command that will delete every generation except the current one. [*(Source)*](https://releases.nixos.org/nix/nix-2.22.3/manual/command-ref/nix-collect-garbage.html)
>
> - The next most used way is to use the `nix-store --optimise -v` command, which will create internal symlinks in the `/nix/store` folder, that stores every software installed on your system. It removes duplicates and keeps only one instance of a software version. [*(Source)*](https://releases.nixos.org/nix/nix-2.22.3/manual/command-ref/nix-store/optimise.html)
>
> - Modifying this project [`configuration.nix`](./configuration.nix) and adding the following `nix.optimise.automatic = true;` which will make NixOS optimize the Nix store during uptime. Then reinstall the configuration and reboot. [*(Source)*](https://nixos.wiki/wiki/Storage_optimization)

> [!IMPORTANT]
> #### Using backups
> 
> This installation scripts generates backups of generations between switches, to avoid the pain of changing something and it wrecks the whole configuration.
> In case you've changed something in the configuration and failed to reinstall it, you can reinstall a backup using the following method : 
>
> Backup of the system configuration :
> ```sh
> # Warp into the system root folder
> cd /
>
> # Clear the NixOS configuration folder before installing the backup 
> sudo rm -rf /etc/nixos/
>
> # Extracting the configuration backup, since the installation script keeps the absolute paths when creating backups. 
> sudo tar -Jxvf /etc/nixos_backups/backup_<timestamp>.tar.xz
> ```
> Backup of the custom software configurations : 
>
> ```sh
> # Warp into the system root folder
> cd /
> 
> # Clear the system configurations folder before installing the backup 
> sudo rm -rf /etc/nixos/
>
> # Extracting the softawre configurations backup, since the installation script keeps the absolute paths when creating backups
> sudo tar -Jxvf /etc/.dotfiles_backups/backup_<timestamp>.tar.xz
> ```
>
> *The backup names use the pattern : `backup_YYYYMMDD_HHMMSS.tar.xz` so a backup named `backup_20241231_002816.tar.xz` would have been created the 31th of December 2024 at 00:28:16 in the 24 hours format.*
> 
> Switching the system on the backup : 
> ```sh
> sudo nixos-rebuild switch --upgrade-all
> ```
>
> Once this command is finished, **reboot** using the `sudo reboot now` command or the system's UI.
>
> #### Removing previous configuration backups : 
>
> If you want to delete the backups whose been generated, in order to earn some more storage space, you only need to clear the following folders : 
> 
> - System configurations backups : `/etc/nixos_backups/` using `sudo rm -rf /etc/nixos_backups/`
> - Custom configurations backups : `~/.dotfiles_backups/` using `sudo rm -rf ~/.dotfiles_backups/`

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
