{ config, pkgs, ... }:
{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  home.stateVersion = "19.09";

  imports = [
    # glitz
    ./etc/awesome.nix
    ./etc/compton.nix
    ./etc/dunst.nix
    ./etc/interface.nix
    ./etc/polybar.nix
    ./etc/xresources.nix

    # general config
    ./etc/ext.nix
    ./etc/services.nix
    ./etc/programs.nix

  ];

  nixpkgs.config.allowUnfree = true;

  home.sessionVariables = {
    EDITOR = "emacs";
    BROWSER = "firefox";
    LC_CTYPE = "en_GB.UTF-8";
    PAGER = "less";
    TERM = "kitty";
  };

  systemd.user.startServices = true;

  xdg.enable = true;
  home.keyboard.layout = "uk";
}
