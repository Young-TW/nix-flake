{ config, lib, pkgs, ... }:

let
  pinnedPkgs = import (builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/refs/tags/25.05.tar.gz";
    sha256 = "1915r28xc4znrh2vf4rrjnxldw2imysz819gzhk9qlrkqanmfsxd";
  }) { config = { allowUnfree = true; }; };

  hmTarball = builtins.fetchTarball {
    url = "https://github.com/nix-community/home-manager/archive/refs/heads/release-25.05.tar.gz";
    sha256 = "sha256-oV695RvbAE4+R9pcsT9shmp6zE/+IZe6evHWX63f2Qg=";
  };
in
{
  nixpkgs.pkgs = pinnedPkgs;

  imports = [
    ./hardware-configuration.nix
    (import "${hmTarball}/nixos")
    ./modules/base.nix
    ./modules/users/young.nix
    ./modules/desktop/gnome.nix
    ./modules/audio.nix
    ./modules/apps.nix
    ./modules/home-manager.nix
  ];

  system.stateVersion = "25.05";
}
