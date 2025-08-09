{ config, pkgs, ... }:
{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "n7-z790";
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

  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [ fcitx5-chewing ];
  };

  services.openssh.enable = true;
  services.printing.enable = true;

  # 關閉文件產生
  documentation.nixos.enable = false;
  documentation.enable = false;
}
