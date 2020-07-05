function fish_mode_prompt
    switch $fish_bind_mode
        case default
            set_color --bold red
            echo -n "🅽 "
        case replace-one
            set_color --bold green
            echo -n "🆁 "
        case visual
            set_color --bold brmagenta
            echo -n "🆅 "
    end
    set_color normal
end
