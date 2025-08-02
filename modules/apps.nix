{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    vim wget fish fastfetch btop tmux curl htop bat
    rustc cargo git github-cli cmake clang yt-dlp
    neovim ranger onefetch cxxopts fmt ibus jetbrains-mono eza
  ];
}
