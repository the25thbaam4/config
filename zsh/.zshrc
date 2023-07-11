# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install

HISTFILE=~/.config/zsh/.histfile
HISTSIZE=50000
SAVEHIST=50000

setopt autocd beep extendedglob nomatch
setopt correct
setopt notify

# bindkey '^?' backward-delete-char
# bindkey '^[[5~' up-line-or-history
# bindkey '^[[3~' delete-char
# bindkey '^[[6~' down-line-or-history
# bindkey '^[[A' up-line-or-search
# bindkey '^[[D' backward-char
# bindkey '^[[B' down-line-or-search
# bindkey '^[[C' forward-char 
# bindkey "^[[H" beginning-of-line
# bindkey "^[[F" end-of-line
# # End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'
autoload -U colors && colors

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# The meaning of these options can be found in man page of `zshoptions`.
# setopt HIST_IGNORE_ALL_DUPS  # do not put duplicated command into history list
# setopt HIST_SAVE_NO_DUPS  # do not save duplicated command
setopt HIST_REDUCE_BLANKS  # remove unnecessary blanks
setopt INC_APPEND_HISTORY_TIME  # append command to history file immediately after execution
setopt EXTENDED_HISTORY  # record command start time


# vi Mode
bindkey -v 

# Command line editor
autoload -z edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line


# plugins
source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/themes/zsh-syntax-highlighting/themes/catppuccin_frappe-zsh-syntax-highlighting.zsh
source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.config/zsh/zsh-aliases
source ~/.config/zsh/colors
source ~/.config/zsh/color_man_pages.zsh
# source ~/.config/zsh/prompt.zsh
 source ~/.config/zsh/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
# neofetch
# fortune | cowsay -W 30
# export PATH_TO_FX=/usr/lib/jvm/java-20-openjdk/lib
export JAVA_HOME=/usr/lib/jvm/java-20-openjdk
export PATH=$PATH:$JAVA_HOME/bin
export PATH="$PATH:/home/ace/.local/bin"
# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
