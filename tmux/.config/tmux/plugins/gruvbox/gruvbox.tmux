#!/usr/bin/env bash

# setting the locale, some users have issues with different locales, this forces the correct one
export LC_ALL=en_US.UTF-8

get_tmux_option() {
  local option=$1
  local default_value=$2
  local option_value=$(tmux show-option -gqv "$option")
  if [ -z $option_value ]; then
    echo $default_value
  else
    echo $option_value
  fi
}

main()
{
  show_powerline=$(get_tmux_option "@gruvbox-show-powerline" false)
  show_flags=$(get_tmux_option "@gruvbox-show-flags" false)
  show_left_icon=$(get_tmux_option "@gruvbox-show-left-icon" smiley)
  show_left_sep=$(get_tmux_option "@gruvbox-show-left-sep" )
  show_right_sep=$(get_tmux_option "@gruvbox-show-right-sep" )
  show_border_contrast=$(get_tmux_option "@gruvbox-border-contrast" false)
  show_refresh=$(get_tmux_option "@gruvbox-refresh-rate" 5)

  # OLED Gruvbox Pallette
  white='#fbf1c7'
  gray='#a89984'
  # dark_gray='#282828'
  dark_gray='#000000'
  light_purple='#d3869b'
  dark_purple='#b16286'
  cyan='#458588'
  green='#98971a'
  orange='#d65d0e'
  red='#cc241d'
  pink='#689d6a'
  yellow='#d79921'


  # Handle left icon configuration
  case $show_left_icon in
      smiley)
          left_icon="☺";;
      session)
          left_icon="#S ";;
      window)
          left_icon="#W ";;
      *)
          left_icon=$show_left_icon;;
  esac

  # Handle powerline option
  if $show_powerline; then
      right_sep="$show_right_sep"
      left_sep="$show_left_sep"
  fi

  case $show_flags in
    false)
      flags=""
      current_flags="";;
    true)
      flags="#{?window_flags,#[fg=${dark_purple}]#{window_flags},}"
      current_flags="#{?window_flags,#[fg=${light_purple}]#{window_flags},}"
  esac

  # sets refresh interval to every 5 seconds
  tmux set-option -g status-interval $show_refresh

  # set the prefix + t time format
	tmux set-option -g clock-mode-style 12

  # set length
  tmux set-option -g status-left-length 100
  tmux set-option -g status-right-length 100

  # pane border styling
  if $show_border_contrast; then
    tmux set-option -g pane-active-border-style "fg=${light_purple}"
  else
    tmux set-option -g pane-active-border-style "fg=${dark_purple}"
  fi
  tmux set-option -g pane-border-style "fg=${gray}"

  # message styling
  tmux set-option -g message-style "bg=${dark_gray},fg=${white}"

  # status bar
  tmux set-option -g status-style "bg=${dark_gray},fg=${white}"

  # Powerline Configuration
  if $show_powerline; then

      tmux set-option -g status-left "#[bg=${green},fg=${dark_gray}]#{?client_prefix,#[bg=${yellow}],} ${left_icon} #[fg=${green},bg=${dark_gray}]#{?client_prefix,#[fg=${yellow}],}${left_sep}"
      tmux set-option -g  status-right ""
      powerbg=${dark_gray}

      tmux set-window-option -g window-status-current-format "#[fg=${dark_gray},bg=${dark_purple}]${left_sep}#[fg=${white},bg=${dark_purple}] #I #W ${current_flags} #[fg=${dark_purple},bg=${dark_gray}]${left_sep}"

  # Non Powerline Configuration
  else
    tmux set-option -g status-left "#[bg=${green},fg=${dark_gray}]#{?client_prefix,#[bg=${yellow}],} ${left_icon}"

    tmux set-option -g status-right ""

    tmux set-window-option -g window-status-current-format "#[fg=${white},bg=${dark_purple}] #I #W${current_flags} "

  fi

  tmux set-window-option -g window-status-format "#[fg=${white}]#[bg=${dark_gray}] #I #W ${flags}"
  tmux set-window-option -g window-status-activity-style "bold"
  tmux set-window-option -g window-status-bell-style "bold"
}

# run main function
main
