# File: ~/.zshrc
# Require https://github.com/agkozak/zsh-z 

## Interactive Shell Customisation
export CLICOLOR=1
autoload -Uz compinit && compinit

## load ZSH-Z (jump)
source ~/.zplugins/zsh-z.plugin.zsh

## Nicer completion menu
zstyle ':completion:*' menu select

## Git
autoload -Uz vcs_info
precmd() { vcs_info }
 
# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats ' %F{yellow}(git:%F{red}%b%F{yellow})'
zstyle ':vcs_info:svn:*' formats ' %F{yellow}(svn:%F{red}%b%F{yellow})'
 
# Set up the prompt (with git branch name)
setopt PROMPT_SUBST
PROMPT='%F{10}%n@%m %F{cyan}%~${vcs_info_msg_0_}%f $ '

## Cycle through history based on characters already typed on the line with up and down key
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end
