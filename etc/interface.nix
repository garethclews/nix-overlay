{ pkgs, config, ... }: {
  gtk = {
    font = {
      package = pkgs.fira;
      name = "Fira Sans 12";
    };
    iconTheme = {
      package = pkgs.paper-icon-theme;
      name = "Paper";
    };
    theme = {
      package = pkgs.nordic;
      name = "Nordic";
    };
  };
}
