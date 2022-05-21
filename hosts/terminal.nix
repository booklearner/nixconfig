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
      helix
      htop
      libusb
      neovim
      opam
      rustup
      silver-searcher
      tree
      wget
    ];
  };

  # use zsh, since it's the default on macos
  programs.zsh.enable = true;

  # auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  nix.package = pkgs.nix;
}
