{ pkgs, config, ... }: {
  gtk = {
    enable = true;

    font = {
      package = pkgs.overpass;
      name = "Overpass 11";
    };
    # iconTheme = {
    #   package = pkgs.paper-icon-theme;
    #   name = "Paper";
    # };
    theme = {
      package = import ./pkgs/horizon/default.nix;
      name = "Horizon";
    };
  };
}
