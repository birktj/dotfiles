function fish_right_prompt
  set -l last_command_status $status
  set_color yellow
  echo -n -s $last_command_status "|"
  set_color $fish_color_autosuggestion ^/dev/null; or set_color grey
  date "+%H:%M:%S"
  set_color normal
end
