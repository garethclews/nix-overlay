Personal nixOS overlays for aloysius@karasu

What this repository includes:

1. nixpkgs overlay: the things I want installed but don't need to be available
   for anybody but me
2. configuration files for
    * [i3-gaps](https://i3wm.org)
    * [polybar](https://github.com/polybar/polybar)
    * [dunst](https://dunst-project.org/)
    * xresources
    * font settings (basically prefer Fira for everything)
    * my choice of services for my user
    * over-riding options for a selection of applications


## Usage

First you need to clone this repository into your user's `~/.config` directory.

``` sh
mkdir -p ~/.config/nixpkgs
git clone https://gitlab.com/karetsu/nix-overlays ~/.config/nixpkgs
```


## Using the overlay

There are two pieces of this particular puzzle. The first is just a
straightforward overlay of the nix store via the content of `./overlays`. You
can install _only_ this by using:

```sh
nix-env -f '<nixpkgs>' -r -iA aloysius
```

Following this you should add all packages which you want in your user environment
to the `aloysius.nix` file and then use `nix-rebuild` to update the environment.
This installs everything that is listed and creates the necessary symlinks to
the nix store.

Note that this also prints a nice diff with the changes made to the environment after it
completes :3


## Using the dotfiles

Also included here are a great many of my personal configuration files (in .nix
form) which are managed by the wonderful
[home-manager](https://github.com/rycee/home-manager). This will take your nix
recipes and turn them into the `.config` or `.foo versions` that they need to
be. If you wish to 'compile' my dotfiles then you need to install home-manager
first. Please go and read the disclaimer on the repo. They (and I) take no
responsibility for this overwriting your own config files. Read the disclaimer
and understand what it means.

#### Stage 1: getting home-manager

I use the 19.03 release of nixOS, so it is a simple case of:

``` sh
nix-channel --add https://github.com/rycee/home-manager/archive/release-19.03.tar.gz home-manager
nix-channel --update

nix-shell '<home-manager>' -A install
```

If you do not use nixOS or want follow the master/unstable channel go read the
README in rycee's repo.


#### Stage 2: compiling the dotfiles

If you want to compile everything I have included then all you need to do is
run:

``` sh
home-manager build
```

This will then create a `result` directory with all of the configs inside. You
can then cherry-pick which ones you want and symlink it yourself. If you are
completely insane and want all my settings as your own then you can swap out
`build` for `switch** and then you should reload your window manager or desktop
environment.

**Note:** Most of these configurations depend heavily on my own curated
collection of [shell scripts](https://gitlab.com/karetsu/scripts). Polybar and
i3 will not work as intended without them. You have been warned! Eventually this
will become a payload delivered as part of the overlay, but that's quite a way
away yet and until then you're on your own.


### Customising the choice of dotfiles

In order to add or remove things from the compilation of the dotfiles you need
only edit the `./etc/home.nix` file and add or remove your own.
