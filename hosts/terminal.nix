# macbook pro
{ pkgs, ... }:
{
  environment = {
    # packages to install on 'terminal'
    systemPackages = with pkgs; [
      elixir
      emacsNativeComp
      flyctl
      fzf
      git
      github-cli
      helix
      htop
      neovim
      nodejs
      opam
      rustup
      silver-searcher
      tree
      wget
      ghc
      stack
      # zig -- marked as broken right now
      zls
    ];
  };

  # use zsh, since it's the default on macos
  programs.zsh.enable = true;

  # auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  nix.package = pkgs.nix;
}
