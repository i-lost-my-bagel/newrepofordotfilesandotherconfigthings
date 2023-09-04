{ config, pkgs, ...}:

{
  programs.bash = {
    enable = true;
    shellAliases = {
      "paru" = "sudo nixos-rebuild switch && home-manager switch";
    };
  };
}
