# Nix-Flake

This repository is my personal Nix flake configuration.

I use this flake to manage my NixOS system, development environments, and various tools.

## Todo

- [ ] Add hyprland configuration
- [ ] Remove x11, vnc, rdp
- [ ] Make all comments in English
- [ ] Add zhuyin configuration
- [ ] Use `nix flake check` to verify the flake
- [ ] Use more flakes to modularize the configuration

## Usage

Clone this repo.

```bash
git clone https://github.com/Young-TW/nix-flake.git
cd nix-flake
```

copy the configuration files to the appropriate locations.

```bash
cp -rf . /etc/nixos
```

Then, rebuild your NixOS system with the new configuration.

```bash
sudo nixos-rebuild switch --flake .#n7-z790
```

If you want to clean up the old generations, you can run:

```bash
sudo nix-collect-garbage -d
```
