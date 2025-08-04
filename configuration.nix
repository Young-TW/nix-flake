{ config, pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;
  nix = {
    package = pkgs.nix;
    settings.experimental-features = [ "nix-command" "flakes" ];
  };

  imports = [
    ./hardware-configuration.nix
    ./modules/base.nix
    ./modules/users/young.nix
    ./modules/desktop/gnome.nix
    ./modules/audio.nix
    ./modules/apps.nix
    ./modules/home-manager.nix
  ];

  system.stateVersion = "25.05";
}
