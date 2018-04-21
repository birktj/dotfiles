-- An example, simple ~/.xmonad/xmonad.hs file.
-- It overrides a few basic settings, reusing all the other defaults.
--

import XMonad
import XMonad.Layout.Spacing
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.EwmhDesktops
import XMonad.Layout.Gaps
import XMonad.Layout.NoBorders
import XMonad.Layout.Fullscreen
import XMonad.Util.SpawnOnce
import XMonad.Util.Run
import XMonad.Util.NamedWindows
import qualified XMonad.StackSet as W
import Graphics.X11.ExtraTypes.XF86

import Data.List
import Data.Function
import Control.Monad

import qualified Data.Map as M

myLayoutHook = smartBorders . gaps [(U, 24)] . spacing 10 $ layoutHook def
myEventHook  = handleEventHook def
myLogHook = eventLogHook <+> logHook def
myStartupHook = do
    startupHook def
    setFullscreenSupported
    spawnOnce "polybar top"

myKeys = (\c -> M.fromList [ ((0, xF86XK_AudioLowerVolume), spawn "amixer -q sset Master 2%-")
                           , ((0, xF86XK_AudioRaiseVolume), spawn "amixer -q sset Master 2%+")
                           , ((0, xF86XK_AudioMute), spawn "pactl set-sink-mute 0 toggle")
                           , ((0, xF86XK_MonBrightnessUp), spawn "xbacklight -inc 10")
                           , ((0, xF86XK_MonBrightnessDown), spawn "xbacklight -dec 10")
                           , ((modMask c, xK_p), spawn "dmenu_run -l 10 -w 500 -h 30 -fn \"Source Code Pro:size=13\" -p \"> \" -dim 0.5 -o 0.9 -x 710 -y 390 -nb \"#2e3440\" -nf \"#d8dee9\" -sb \"#d8dee9\" -sf \"#2e3440\"") ]) <+> keys def

main = do
    forM_ [".xmonad-workspace-log", ".xmonad-title-log"] $ \file -> do
        safeSpawn "mkfifo" ["/tmp/" ++ file]
    xmonad . fullscreenSupport . ewmh . docks $ def
            { borderWidth        = 2
            , terminal           = "alacritty"
            , modMask            = mod4Mask
            , layoutHook         = myLayoutHook
            , handleEventHook    = myEventHook
            , startupHook        = myStartupHook
            , logHook            = myLogHook
            , keys               = myKeys
            , normalBorderColor  = "#2e3440"
            , focusedBorderColor = "#657b83" }


setFullscreenSupported :: X ()
setFullscreenSupported = withDisplay $ \dpy -> do
    r <- asks theRoot
    a <- getAtom "_NET_SUPPORTED"
    c <- getAtom "ATOM"
    supp <- mapM getAtom ["_NET_WM_STATE_HIDDEN"
                         ,"_NET_WM_STATE_FULLSCREEN" -- XXX Copy-pasted to add this line
                         ,"_NET_NUMBER_OF_DESKTOPS"
                         ,"_NET_CLIENT_LIST"
                         ,"_NET_CLIENT_LIST_STACKING"
                         ,"_NET_CURRENT_DESKTOP"
                         ,"_NET_DESKTOP_NAMES"
                         ,"_NET_ACTIVE_WINDOW"
                         ,"_NET_WM_DESKTOP"
                         ,"_NET_WM_STRUT"
                         ]
    io $ changeProperty32 dpy r a c propModeReplace (fmap fromIntegral supp)

 
eventLogHook = do
  winset <- gets windowset
  title <- maybe (return "") (fmap ((\n -> if length n > 40 then take 40 n ++ "..." else n) . show) . getName) . W.peek $ winset
  let currWs = W.currentTag winset
  let wss = map W.tag $ W.workspaces winset
  let wsStr = join $ map (fmt currWs) $ sort' wss

  io $ appendFile "/tmp/.xmonad-title-log" (title ++ "\n")
  io $ appendFile "/tmp/.xmonad-workspace-log" (wsStr ++ "\n")

  where fmt currWs ws
          | currWs == ws = "[" ++ ws' ws ++ "]"
          | otherwise    = " " ++ ws' ws ++ " "
          where
            ws' "1" = "\62057" 
            ws' "2" = "\61728" 
            ws' "3" = "\61729" 
            ws' "4" = "\61441"
            ws' _   = "\61704" 


        sort' = sortBy (compare `on` (!! 0)) 
