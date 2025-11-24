# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="af-magic"

export WORKSPACE="$HOME/Workspace"
export WORKSPACE_ENV="$WORKSPACE/env"
mkdir -p $WORKSPACE/env

export WORKSPACE_SAVE="$WORKSPACE/save"
mkdir -p $WORKSPACE/save

# --------------------------------------------------------------------
append_path () {
  export PATH="$PATH:$1"
}
HIST_STAMPS="yyyy-mm-dd"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
source $HOME/.zsh_aliases

export LANG=en_US.UTF-8

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# --------------------------------------------------------------------
# NVM
# --------------------------------------------------------------------
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# --------------------------------------------------------------------
# ANDROID
# --------------------------------------------------------------------

export ANDROID_HOME="$WORKSPACE_ENV/android/sdk"
export ANDROID_USER_HOME="$ANDROID_HOME/.android/"

append_path "$ANDROID_USER_HOME"
append_path "$ANDROID_HOME"
append_path "$ANDROID_HOME/emulator"
append_path "$ANDROID_HOME/platform-tools"
append_path "$ANDROID_HOME/cmdline-tools/latest/bin"
append_path "$ANDROID_HOME/tools"
append_path "$ANDROID_HOME/tools/bin"
# --------------------------------------------------------------------
# LUA LSP
# --------------------------------------------------------------------
export PATH="$PATH:$WORKSPACE_ENV/lua/lua-main/src:$WORKSPACE_ENV/lua/lsp/bin"

# --------------------------------------------------------------------
# FLUTTER
# --------------------------------------------------------------------
export FLUTTER_HOME="$WORKSPACE_ENV/flutter"
append_path "$FLUTTER_HOME/bin"

# Add HOMEBREW to PATH
export PATH="$PATH:/opt/homebrew/bin"

eval "$(starship init zsh)"

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"
export PATH="/opt/homebrew/bin:$PATH"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
