{ config, pkgs, ... }:
{
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

      # 建議把原本 users.users.young.packages 的 GUI 放到這裡
      home.packages = with pkgs; [
        alacritty amberol bitwarden brave discord ghostty dolphin-emu
        element-desktop kitty mindustry obs-studio osu-lazer
        prismlauncher telegram-desktop vscode
      ];
    };
  };
}
