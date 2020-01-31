{ config, lib, pkgs, ... }:
{
  services.compton = {
    enable         = true;
    backend        = "glx";

    shadow         = true;
    shadowExclude  = [ "_GTK_FRAME_EXTENTS@:c"
                       "window_type *= 'menu'"
                       "window_type = 'utility'"
                       "window_type = 'popup_menu'"
                       "window_type = 'dropdown_menu'"
                       "class_g = 'dzen2'"
                       "name    = 'dzen title'"
                     ];
    shadowOpacity  = "0.3";
    shadowOffsets  = [ (-3) (-3) ];

    extraOptions = ''
      shadow-radius   = 3;
    '';
  };
}