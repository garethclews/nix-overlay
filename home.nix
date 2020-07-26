{ config, pkgs, ... }: {
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  home.stateVersion = "20.03";

  imports = [
    # glitz
    ./etc/dunst.nix
    ./etc/picom.nix
    ./etc/polybar.nix
    ./etc/xresources.nix

    # general config
    ./etc/services.nix
    ./etc/programs.nix

    # private... stuff
  ];

  nixpkgs.config.allowUnfree = true;

  home.sessionVariables = {
    EDITOR = "emacs";
    BROWSER = "firefox";
    LC_CTYPE = "en_GB.UTF-8";
    PAGER = "less";
    TERM = "termite";
  };

  systemd.user.startServices = true;

  xdg.enable = true;
  home.keyboard.layout = "uk";
}
