set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'

set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_color_cleanstate green
set __fish_git_prompt_color_dirtystate blue
set __fish_git_prompt_color_untrackedfiles magenta
set __fish_git_prompt_color_stagedstate red
set __fish_git_prompt_color_stateseparator white
set __fish_git_prompt_color_upstream_ahead white
set __fish_git_prompt_color_upstream_behind white

set __fish_git_prompt_char_cleanstate '✔'
set __fish_git_prompt_char_dirtystate '✚'
set __fish_git_prompt_char_untrackedfiles '…'
set __fish_git_prompt_char_stagedstate '●'
set __fish_git_prompt_char_stateseparator '|'
set __fish_git_prompt_char_upstream_ahead '↑'
set __fish_git_prompt_char_upstream_behind '↓'

function fish_prompt
    tput setaf 8
    printf "┌─┨"
    tput setaf 9
    echo -n (whoami)
    tput setaf 11
    echo -n "@"
    tput setaf 10
    echo -n (hostname|cut -d . -f 1)
    tput setaf 11
    echo -n ":"
    tput setaf 12
    echo -n (prompt_long_pwd)
    tput setaf 8
    echo -n "┠"
    echo -n (__fish_git_prompt "──┨%s"(tput setaf 8)"┠")
    echo "─╼"
    printf "└─╸"
    set_color normal
end
