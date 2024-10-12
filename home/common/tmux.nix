{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    aggressiveResize = true;
    baseIndex = 1;
    clock24 = true;
    historyLimit = 1000000;
    mouse = false;
    terminal = "xterm-256color";
    plugins = with pkgs; [
      { plugin = tmuxPlugins.open; }
      {
        plugin = tmuxPlugins.catppuccin;
        extraConfig = ''
          set-option -g @catppuccin_flavour 'macchiato'
          set-option -g @catppuccin_window_left_separator ""
          set-option -g @catppuccin_window_right_separator " "
          set-option -g @catppuccin_window_middle_separator " █"
          set-option -g @catppuccin_window_number_position "right"
          set-option -g @catppuccin_window_default_fill "number"
          set-option -g @catppuccin_window_default_text "#W"
          set-option -g @catppuccin_window_current_fill "number"
          set-option -g @catppuccin_window_current_text "#W#{?window_zoomed_flag,(),}"
          set-option -g @catppuccin_status_modules_right "directory host date_time"
          set-option -g @catppuccin_status_modules_left "session"
          set-option -g @catppuccin_status_left_separator  " "
          set-option -g @catppuccin_status_right_separator " "
          set-option -g @catppuccin_status_right_separator_inverse "no"
          set-option -g @catppuccin_status_fill "icon"
          set-option -g @catppuccin_status_connect_separator "no"
          set-option -g @catppuccin_directory_text "#{b:pane_current_path}"
          set-option -g @catppuccin_date_time_text "%H:%M"
        '';
      }
    ];
    extraConfig = ''
      set-option -ga terminal-overrides ",xterm-256color:Tc"
      set-option -g prefix M-s

      set-option -g renumber-windows on
      set-option -g status-position top
      set-option -g word-separators ' @=()[]-_:\'
      set-option -g focus-events on
      set-option -s -g escape-time 0
      set-option -w -g wrap-search off

      is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
          | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'"

      # reset all keymaps
      unbind-key -a
      ### Keymaps ###
      bind-key -T copy-mode-vi M-h select-pane -L
      bind-key -T copy-mode-vi M-j select-pane -D
      bind-key -T copy-mode-vi M-k select-pane -U
      bind-key -T copy-mode-vi M-l select-pane -R
      bind-key -T copy-mode-vi M-p send -X search-backward '(➜|•|)'
      bind-key -T copy-mode-vi v send -X begin-selection
      bind-key -T copy-mode-vi y send -X copy-selection-and-cancel
      bind-key -T copy-mode-vi o send -X copy-selection-and-cancel
      bind-key -n M-Down resize-pane -D 5
      bind-key -n M-Left resize-pane -L 10
      bind-key -n M-Right resize-pane -R 10
      bind-key -n M-Up resize-pane -U 5
      bind-key -n M-h if-shell "$is_vim" 'send-keys M-h' 'select-pane -L'
      bind-key -n M-j if-shell "$is_vim" 'send-keys M-j' 'select-pane -D'
      bind-key -n M-k if-shell "$is_vim" 'send-keys M-k' 'select-pane -U'
      bind-key -n M-l if-shell "$is_vim" 'send-keys M-l' 'select-pane -R'
      bind-key -r M-s send-prefix
      bind-key -r h select-window -t :-
      bind-key -r l select-window -t :+
      bind-key : command-prompt
      bind-key - split-window -v -c "#{pane_current_path}"
      bind-key \\ split-window -h -c "#{pane_current_path}"
      bind-key d detach-client
      bind-key r source-file ~/.config/tmux/tmux.conf\; display "Config Reloaded!"
      bind-key W new-window -c '#{pane_current_path}'
      bind-key X run-shell 'tmux switch-client -n \; kill-session -t "$(tmux display-message -p "#S")" || tmux kill-session'
      bind-key k copy-mode
      bind-key w command-prompt -p "(rename-window)" "rename-window '%%'"
      bind-key x confirm-before -p "kill-pane #P? (y/n)" kill-pane
      bind-key z resize-pane -Z
    '';
  };
}
