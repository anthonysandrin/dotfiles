function prompt_long_pwd
    echo $PWD | sed -e "s|^$HOME|~|" -e 's|^/private||'
end
