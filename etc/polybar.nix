{ pkgs, ... }: {
  imports = [
    # ./polybar-light.nix
    ./polybar-dark.nix
  ];
}
