#!/bin/bash
export BROWSER='elinks'
export PYTHONPATH+="$HOME/lib/python"
export PATH="$HOME/bin:/sbin:/usr/sbin:$PATH"
export XDG_DESKTOP_DIR=$HOME
export XDG_CONFIG_HOME="$HOME/.config"
export SSH_ENV="$HOME/.ssh/environment"
export GEGL_USE_OPENCL='yes'

case "$(tty)" in
    /dev/tty1)
        exec startx
        ;;
    #/dev/tty[23])
    #    type -p fbterm &&
    #        exec fbterm-tint
    #    ;;
esac
. $HOME/.bashrc
