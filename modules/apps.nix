{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # system tools
    curl wget htop tmux fish vim neovim bat eza ranger fastfetch onefetch btop

    # development tools
    rustc cargo git github-cli cmake clang cxxopts fmt

    # Fonts and input methods
    ibus jetbrains-mono

    # multimedia tools
    yt-dlp cava

    # container tools
    docker podman podman-compose uv
  ];
}
