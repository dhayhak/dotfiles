# https://github.com/chrishunt/dot-files/blob/master/.tmux.conf

###########################
# Status Bar
###########################

# enable UTF-8 support in status bar
# set -g status-utf8 on

# set refresh interval for status bar
set -g status-interval 30

# center the status bar
set -g status-justify left

# show session, window, pane in left status bar
set -g status-left-length 40
set -g status-left '#[fg=green]#S#[fg=blue] #I:#P #[default]'

# show hostname, date, time, and battery in right status bar
set-option -g status-right '#[fg=green]#H#[default] %m/%d/%y %I:%M\
 #[fg=red]#(battery discharging)#[default]#(battery charging)'

###########################
# Colors
###########################

# color status bar
set -g status-bg colour235
set -g status-fg white

# highlight current window
set-window-option -g window-status-current-fg black
set-window-option -g window-status-current-bg green

# set color of active pane
set -g pane-border-fg colour235
set -g pane-border-bg black
set -g pane-active-border-fg green
set -g pane-active-border-bg black
