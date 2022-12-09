{ config, lib, pkgs, ... }: {
  services.picom = {
    enable = true;
    backend = "xr_glx_hybrid";

    shadow = true;
    shadowExclude = [
      "_GTK_FRAME_EXTENTS@:c"
      "window_type *= 'menu'"
      "window_type = 'utility'"
      "window_type = 'popup_menu'"
      "window_type = 'dropdown_menu'"
    ];
    shadowOpacity = 0.15;
    shadowOffsets = [ (-5) (-5) ];
    fade = true;
    fadeDelta = 5;

    settings = { shadow-radius = 5; };
  };
}
