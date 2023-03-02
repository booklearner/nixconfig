# macbook pro
{ pkgs, ... }:
{
  environment = {
    # packages to install on 'terminal'
    systemPackages = with pkgs; [
      bat
      emacsNativeComp
      fzf
      git
      github-cli
      helix
      htop
      neovim
      nixpkgs-fmt
      nixfmt
      opam
      packer
      podman
      podman-compose
      rustup
      silver-searcher
      tree
      wget
      ghc
      stack
      # zig
      # zls
      go
      gopls
      qemu
      git-crypt
      postgresql
    ];
  };

  # use zsh, since it's the default on macos
  programs.zsh.enable = true;

  # auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  nix.package = pkgs.nix;
}
