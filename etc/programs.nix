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

    termite = {
      enable = true;
      allowBold = true;
      backgroundColor = "#232530";
      foregroundColor = "#fdf0ed";
      clickableUrl = true;
      cursorShape = "ibeam";
      font = "M+ 2m 12";
      # font = "Iosevka Custom 12";
      fullscreen = true;
      optionsExtra = ''
        [colors]
        # Base16 Horizon Dark
        # Author: Michaël Ball (http://github.com/michael-ball/)

        foreground          = #CBCED0
        foreground_bold     = #CBCED0
        cursor              = #CBCED0
        cursor_foreground   = #1C1E26
        background          = #1C1E26

        # 16 color space

        # Black, Gray, Silver, White
        color0  = #424451
        color8  = #6F6F70
        color7  = #CBCED0
        color15 = #E3E6EE

        # Red
        color1  = #E93C58
        color9  = #E93C58

        # Green
        color2  = #EFAF8E
        color10 = #EFAF8E

        # Yellow
        color3  = #EFB993
        color11 = #EFB993

        # Blue
        color4  = #DF5273
        color12 = #DF5273

        # Purple
        color5  = #B072D1
        color13 = #B072D1

        # Teal
        color6  = #24A8B4
        color14 = #24A8B4

        # Extra colors
        color16 = #E58D7D
        color17 = #E4A382
        color18 = #232530
        color19 = #2E303E
        color20 = #9DA0A2
        color21 = #DCDFE4
      '';

    };
  };
}
