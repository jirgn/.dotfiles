# This file is auto-generated from lua/zenbones/template/tmux.lua
tm_color_active='#88507D'
tm_color_background='#2C363C'
# tm_color_inactive=colour241
# tm_color_feature=colour198
# tm_color_music=colour41
# tm_active_border_color=colour51

set -g status-left ' #[fg=$tm_color_active,bold]#{s/root//:client_key_table} '
set -g status-right '#[fg=$tm_color_active,bold] [#S]#[fg=$tm_color_active,bold] [%d/%m] #[fg=$tm_color_active,bold][%I:%M%p] '
set -g status-style fg=$tm_color_active,bg=$tm_color_background

set -g window-status-current-style fg=$tm_color_active,bg=$tm_color_background,bold

set -g pane-border-style fg=$tm_color_active
set -g pane-active-border-style fg=$tm_color_active

set -g message-style fg='#F0EDEC',bg=$tm_color_background
# set -g message-style fg='#F0EDEC',bg='#CBD9E3'

set -g display-panes-active-colour $tm_color_active
set -g display-panes-colour $tm_color_active

set -g clock-mode-colour $tm_color_active

set -g mode-style fg='#F0EDEC',bg=$tm_color_background
# set -g mode-style fg='#F0EDEC',bg='#CBD9E3'

