{ config, pkgs, ... }:
{
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  programs.firefox.enable = true;

  # 啟用 GNOME Remote Desktop
  services.gnome.gnome-remote-desktop.enable = true;

  # 開防火牆：RDP 3389、VNC 5900（依你要用哪種打開）
  networking.firewall.allowedTCPPorts = [ 3389 5900 ];
}
