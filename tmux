# Tmux settings

# Set XTerm key bindings
setw -g xterm-keys on
set-option -g default-terminal "screen-256color"

# Set reload key to r
bind r source-file ~/.tmux.conf

# Count sessions start at 1
set-option -g base-index 1

# Use vim bindings
#setw -g mode-keys vi
# Set the title bar
set -g set-titles on
set -g set-titles-string '#(whoami) :: #h :: #(curl ipecho.net/plain;echo)'

# Set status bar
set -g status-utf8 on
set -g status-bg black
set -g status-fg white
set -g status-interval 5 
set -g status-left-length 90
set -g status-right-length 60
set -g status-left "#[fg=Green]#(whoami)#[fg=white]::#[fg=blue]#(hostname -s)#[fg=white]::#[fg=yellow]#(curl ipecho.net/plain;echo)"
set -g status-justify left
set -g status-right '#[fg=Cyan]#S #[fg=white]%a %d %b %R'
setw -g mode-mouse on
set-option -g history-limit 10000
unbind [
bind Escape copy-mode
unbind p
bind p paste-buffer
bind-key -t vi-copy 'v' begin-selection
bind-key -t vi-copy 'y' copy-selection
set -g mouse-select-pane on
set -g mouse-resize-pane on
set -g mouse-select-window on
set-option -g update-environment "DISPLAY SSH_ASKPASS SSH_AUTH_SOCK SSH_AGENT_PID SSH_CONNECTION SSH_TTY WINDOWID XAUTHORITY"
