{ pkgs, ... }: {
  services = {
    pasystray.enable = false;

    gnome-keyring = { enable = true; };

    gpg-agent = {
      enable = true;
      defaultCacheTtl = 1800;
      enableSshSupport = true;
    };

    emacs = {
      enable = false;
      socketActivation.enable = true;
    };
  };
}
