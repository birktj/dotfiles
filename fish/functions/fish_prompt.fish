function fish_prompt
    set -l last_command_status $status
    set -l cwd

    if test "$theme_short_path" = 'yes'
        set cwd (basename (prompt_pwd))
    else
        set cwd (prompt_pwd)
    end

    set -l fish     "⋊>"
    set -l ahead    "↑"
    set -l behind   "↓"
    set -l diverged "⥄ "
    set -l dirty    (set_color red) "±" (set_color normal) #"⨯"
    set -l none     "◦"

    set -l normal_color     (set_color normal)
    set -l success_color    (set_color cyan --bold) #(set_color $fish_pager_color_progress ^/dev/null; or set_color cyan)
    set -l error_color      (set_color $fish_color_error ^/dev/null; or set_color red --bold)
    set -l directory_color  (set_color $fish_color_quote ^/dev/null; or set_color brown)
    set -l repository_color (set_color $fish_color_cwd ^/dev/null; or set_color green)

    if test $last_command_status -eq 0
        echo -n -s $success_color $fish $normal_color
    else
        echo -n -s $error_color $fish $normal_color
    end

    echo -n -s " " $directory_color $cwd $normal_color

    if command git rev-parse --git-dir >/dev/null ^/dev/null
        set -l git_branch (
            command git symbolic-ref --short HEAD ^/dev/null;
            or command git show-ref --head -s --abbrev | head -n1 ^/dev/null)

        echo -n -s " on " $repository_color $git_branch $normal_color " "

        if test -n (echo (command git status --porcelain))
            echo -n -s $dirty
        else
            set -l commit_count (command git rev-list --count --left-right "@{upstream}...HEAD" ^/dev/null)

            switch "$commit_count"
                case ""
                  # no upstream
                case "0"\t"0"
                    echo -n -s $none
                case "*"\t"0"
                    echo -n -s $behind
                case "0"\t"*"
                    echo -n -s $ahead
                case "*"
                    echo -n -s $diverged
            end
        end
    end
    #  if test "$theme_short_path" = 'yes'
    #    set root_folder (command git rev-parse --show-toplevel ^/dev/null)
    #    set parent_root_folder (dirname $root_folder)
    #    set cwd (echo $PWD | sed -e "s|$parent_root_folder/||")
    #  end
    #
    #  echo -n -s " " $directory_color $cwd $normal_color
    #  echo -n -s " on " $repository_color (git_branch_name) $normal_color " "
    #
    #  if git_is_touched
    #    echo -n -s $dirty
    #  else
    #    echo -n -s (git_ahead $ahead $behind $diverged $none)
    #  end
    #else
    #  echo -n -s " " $directory_color $cwd $normal_color
    #end

    echo -n -s " "
end
