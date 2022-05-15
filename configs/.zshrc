export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="bureau"
plugins=(git)
source $ZSH/oh-my-zsh.sh
export LANG=en_US.UTF-8

# Nix
if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
  . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi
# fzf
if [ -n "${commands[fzf-share]}" ]; then
  source "$(fzf-share)/key-bindings.zsh"
  source "$(fzf-share)/completion.zsh"
fi
