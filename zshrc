#

# The configurations
source "${DOTS}/zsh/options.zsh"
source "${DOTS}/zsh/bindkeys.zsh"
source "${DOTS}/zsh/history.zsh"
source "${DOTS}/zsh/functions.zsh"
source "${DOTS}/zsh/export.zsh"
source "${DOTS}/zsh/aliases.zsh"
source "${DOTS}/zsh/colours.zsh"
source "${DOTS}/zsh/completion.zsh"

# Homeless modules
#autoload -U promptinit && promptinit && prompt pure
autoload -U edit-command-line && zle -N edit-command-line

# recommended by brew doctor
export PATH="/usr/local/bin:$PATH"

# Autojump (j)
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Prompt
eval "$(starship init zsh)"

# NVM Config
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="${HOME}/.sdkman"
[[ -s "${SDKMAN_DIR}/bin/sdkman-init.sh" ]] && source "${SDKMAN_DIR}/bin/sdkman-init.sh"
