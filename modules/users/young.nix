{ config, pkgs, ... }:
{
  users.users.young = {
    isNormalUser = true;
    description = "young";
    extraGroups = [ "networkmanager" "wheel" ];
    # 需要系統層就留少量 CLI；GUI 交給 HM
    packages = with pkgs; [ ];
  };
}
