set SHELL /bin/fish

set fish_cursor_insert block
set fish_cursor_default block

function ssh
    TERM=screen-256color command ssh $argv
end
#alias ghci /usr/share/ghc-pristine/bin/ghci
#alias runhaskell /usr/share/ghc-pristine/bin/runhaskell
