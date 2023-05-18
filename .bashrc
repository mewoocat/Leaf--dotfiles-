#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls -altr --color=auto'
#alias rm='rm -i'

PS1='[\u@\h \W]\$ '

eval "$(starship init bash)"

PATH="/home/ghost/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/ghost/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/ghost/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/ghost/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/ghost/perl5"; export PERL_MM_OPT;

# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
# Not supported in the "fish" shell.
#(cat ~/.cache/wal/sequences &)

# Alternative (blocks terminal for 0-3ms)
#cat ~/.cache/wal/sequences
#


([ -f ~/.cache/wal/sequences ] && cat ~/.cache/wal/sequences &)

# To add support for TTYs this line can be optionally added.
#source ~/.cache/wal/colors-tty.sh


# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION

export QSYS_ROOTDIR="/hom/ghost/.cache/yay/quartus-free/pkg/quartus-free-quartus/opt/intelFPGA/21.1/quartus/sopc_builder/bin"

export PATH="/home/ghost/.local/bin":$PATH

alias dot='/usr/bin/git --git-dir=$HOME/.dot.git/ --work-tree=$HOME'
alias dot='/usr/bin/git --git-dir=/home/ghost/.dot.git/ --work-tree=/home/ghost'
alias lock='~/.scripts/lock.sh'

# alias vim='/usr/bin/nvim'
alias vi='/usr/bin/nvim'

# Fixes kitty ssh issue
alias ssh="kitty +kitten ssh"

# [ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

alias config='/usr/bin/git --git-dir=/home/ghost/.cfg/ --work-tree=/home/ghost'
alias e='exit'
#alias workdir='cd "/home/ghost/Obsidian Vault/Work/Research Position"'

alias launch='~/.config/hypr/scripts/launch_Hyprland.sh'


