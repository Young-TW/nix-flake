{ config, pkgs, ... }:
{
  programs.dconf.enable = true;

  dconf.settings = {
    "org/gnome/desktop/remote-desktop" = {
      # 二擇一或都開
      rdp-enable = true;   # RDP 建議
      vnc-enable = true;  # 需要 VNC 時改成 true
    };
    # RDP 細節（可選）
    "org/gnome/desktop/remote-desktop/rdp" = {
      screen-share-mode = "extend";   # or "mirror"
      view-only = false;
    };
    # VNC 細節（若啟用 VNC）
    "org/gnome/desktop/remote-desktop/vnc" = {
      view-only = false;
    };
  };
}
