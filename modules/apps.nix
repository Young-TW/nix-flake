{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # system tools
    curl wget htop tmux fish vim neovim bat eza ranger fastfetch onefetch btop tree

    # development tools
    rustc cargo git github-cli cmake clang cxxopts fmt

    # nix tools
    nix-search nix-index nix-update
    nixpkgs-fmt deadnix statix
    nix-prefetch nix-du nix-tree
    nvd
    nix-output-monitor

    # Fonts and input methods
    fcitx5 fcitx5-configtool fcitx5-chewing fcitx5-gtk fcitx5-qt jetbrains-mono

    # multimedia tools
    yt-dlp cava

    # container tools
    docker podman podman-compose uv
  ];
}
