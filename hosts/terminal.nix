# macbook pro
{ pkgs, ... }:
{
  environment = {
    # packages to install on 'terminal'
    systemPackages = with pkgs; [
      neovim
      wget
    ];
  };

  # auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  nix.package = pkgs.nix;
}
