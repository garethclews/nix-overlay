{ pkgs, ... }:
let colours = import ./themes/horizon.nix;
in {
  services.dunst = {
    enable = true;

    iconTheme = {
      name = "Paper";
      package = pkgs.paper-icon-theme;
    };

    settings = {
      global = {
        font = "M+ 1c 12";
        markup = "full";
        format = ''
          <b><span foreground='${colours.base11}'>%a</span></b>
          <b>%s</b>
          <span style='font-style=italic;'>%b</span>'';
        sort = "yes";
        indicate_hidden = "yes";
        alignment = "left";
        bounce_freq = 5;
        show_age_threshold = 60;
        word_wrap = "no";
        ignore_newline = "no";
        geometry = "460x6+2060+72";
        transparency = 0;
        idle_threshold = 120;
        sticky_history = "yes";
        icon_position = "left";
        max_icon_size = 24;
        line_height = 8;
        separator_height = 2;
        padding = 24;
        horizontal_padding = 24;
        separator_color = "frame";
        startup_notification = false;
        show_indicators = "yes";
        frame_width = 0;
        corner_radius = 2;

        shadow-exclude = [
          "name = 'Notification'"
          "class_g ?= 'Dunst'"
          # disable shadows for hidden windows:
          "_NET_WM_STATE@:32a *= '_NET_WM_STATE_HIDDEN'"
          #  "_GTK_FRAME_EXTENTS@:c",
          # disables shadows on sticky windows:
          "_NET_WM_STATE@:32a *= '_NET_WM_STATE_STICKY'"
        ];
      };

      shortcuts = {
        close = "ctrl+space";
        close_all = "ctrl+shift+space";
        history = "ctrl+grave";
        context = "ctrl+shift+period";
      };

      urgency_low = {
        background = colours.base00; # bg-alt;
        foreground = colours.basefg;
        frame_color = colours.basebg;
        timeout = 4;
      };

      urgency_normal = {
        background = colours.base00; # bg-alt;
        foreground = colours.basefg;
        frame_color = colours.basebg;
        timeout = 6;
      };

      urgency_critical = {
        background = colours.base00; # bg;
        foreground = colours.basefg;
        frame_color = colours.base11;
        timeout = 0;
        frame_width = 1;
      };
    };
  };
}
