{ config, pkgs, ...}:
{
  programs = {
    emacs.enable = true;

    direnv = {
      enable = true;
      enableZshIntegration = true;
    };

    fzf = {
      enable = true;
      enableZshIntegration = true;
    };

    firefox = {
      enable = true;
      enableAdobeFlash = false;
      enableGoogleTalk = false;
      enableIcedTea = false;
    };

    # mail :D
    msmtp.enable = true;
    mbsync.enable = true;
    notmuch = {
      enable = true;
      hooks = {
        postNew =
          "${pkgs.afew}/bin/afew -C ~/.notmuch-config --tag --new --verbose";
      };
      new = {
        ignore = [ "trash" "*.json" ];
        tags = [ "new" ];
      };
      search.excludeTags = [ "trash" "deleted" "spam" ];
      maildir.synchronizeFlags = true;
    };

    tmux = {
      enable = true;
      package = pkgs.tmux;
      newSession = true;
      plugins = with pkgs; [
        {
          plugin = tmuxPlugins.continuum;
          extraConfig = ''

            # determine whether to enable 256 colours support
            if "[[ \$\{TERM\} =~ 256color || \$\{TERM\} == fbterm  ]]" 'set -g default-terminal screen-256color'
            # aesthetics

            run-shell "~/.config/tmux/nord-tmux/nord.tmux"
            set -g @nord_tmux_no_patched_font "1"

            # default settings
            set -g default-shell /run/current-system/sw/bin/zsh
            set -g default-command 'zsh'
            set -g status on
            set -g mouse on

            # session saving
            set -g @continuum-restore 'on'
            set -g @continuum-save-interval '60'
          '';
        }
      ];
    };
  };
}
