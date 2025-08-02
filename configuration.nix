# /etc/nixos/configuration.nix
{ config, lib, pkgs, ... }:

let
  # 釘住 nixpkgs 至 25.05（使用你先前提供的 base32 雜湊，OK）
  pinnedPkgs = import (builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/refs/tags/25.05.tar.gz";
    sha256 = "1915r28xc4znrh2vf4rrjnxldw2imysz819gzhk9qlrkqanmfsxd";
  }) { };

  # 釘住 Home Manager（release-25.05）
  hmTarball = builtins.fetchTarball {
    url = "https://github.com/nix-community/home-manager/archive/refs/heads/release-25.05.tar.gz";
    # 請改成正確的 SRI 值（例如 "sha256-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx="）
    sha256 = "sha256-oV695RvbAE4+R9pcsT9shmp6zE/+IZe6evHWX63f2Qg=";
  };
in
{
  # 讓整個系統使用 pinnedPkgs（之後 config 內的 pkgs 都來自這個釘版）
  nixpkgs.pkgs = pinnedPkgs;

  imports = [
    ./hardware-configuration.nix
    (import "${hmTarball}/nixos")   # 匯入 Home Manager NixOS 模組
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    users.young = {
      home.stateVersion = "25.05";

      programs.git = {
        enable = true;
        userName = "young";
        userEmail = "me@youn.gg";
      };

      programs.fish.enable = true;
    };
  };

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Taipei";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "zh_TW.UTF-8";
    LC_IDENTIFICATION = "zh_TW.UTF-8";
    LC_MEASUREMENT = "zh_TW.UTF-8";
    LC_MONETARY = "zh_TW.UTF-8";
    LC_NAME = "zh_TW.UTF-8";
    LC_NUMERIC = "zh_TW.UTF-8";
    LC_PAPER = "zh_TW.UTF-8";
    LC_TELEPHONE = "zh_TW.UTF-8";
    LC_TIME = "zh_TW.UTF-8";
  };

  services.openssh.enable = true;

  # X11 與 GNOME
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.printing.enable = true;

  # 音訊（PipeWire）
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # jack.enable = true;
  };

  users.users.young = {
    isNormalUser = true;
    description = "young";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      bitwarden
      brave
      discord
      element-desktop
      kitty
      mindustry
      obs-studio
      osu-lazer
      steam
      telegram-desktop
      vscode
    ];
  };

  programs.firefox.enable = true;

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
    fish
    fastfetch
    btop
    tmux
    curl
    htop
    bat
    rustc
    cargo
    git
    github-cli
    cmake
    clang
    yt-dlp
    neofetch
    neovim
    ranger
    onefetch
    cxxopts
    fmt
    ibus
    jetbrains-mono
    eza
  ];

  system.stateVersion = "25.05";
}
