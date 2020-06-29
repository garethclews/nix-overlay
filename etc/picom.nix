{ config, lib, pkgs, ... }: {
  services.picom = {
    enable = true;
    backend = "glx";

    shadow = true;
    shadowExclude = [
      "_GTK_FRAME_EXTENTS@:c"
      "window_type *= 'menu'"
      "window_type = 'utility'"
      "window_type = 'popup_menu'"
      "window_type = 'dropdown_menu'"
      # "class_g = 'dzen2'"
      # "name    = 'dzen title'"
    ];
    shadowOpacity = "0.4";
    shadowOffsets = [ (-5) (-5) ];

    extraOptions = ''
      shadow-radius   = 5;
    '';
  };
}
