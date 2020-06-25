{ config, pkgs, ... }: {
  programs = {
    emacs = {
      enable = true;
      extraPackages = epkgs: [ epkgs.vterm ];
    };

    direnv = {
      enable = true;
      enableZshIntegration = true;
    };

    fzf = {
      enable = true;
      enableZshIntegration = true;
    };

    firefox = {
      enable = true;
      enableAdobeFlash = false;
    };
  };
}
