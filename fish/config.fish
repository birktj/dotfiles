set SHELL /bin/fish

function ssh
    TERM=screen-256color command ssh $argv
end
#alias ghci /usr/share/ghc-pristine/bin/ghci
#alias runhaskell /usr/share/ghc-pristine/bin/runhaskell
