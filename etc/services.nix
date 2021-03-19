{ pkgs, ... }: {
  services = {
    pasystray.enable = false;

    gnome-keyring = { enable = true; };

    gpg-agent = {
      enable = true;
      defaultCacheTtl = 1800;
      enableSshSupport = true;
    };

    redshift = {
      enable = true;
      latitude = "51.7967";
      longitude = "-3.2093";
      tray = true;
      settings = {
        redshift = {
          brightness-day = "1";
          brightness-night = "1";
        };
      };
      temperature = {
        night = 3500;
        day = 6500;
      };
    };

    unclutter = {
      enable = true;
      extraOptions = [ "exclude-root" "ignore-scrolling" ];
      threshold = 1;
      timeout = 1;
    };

    emacs = {
      enable = false;
      socketActivation.enable = true;
    };
  };
}
