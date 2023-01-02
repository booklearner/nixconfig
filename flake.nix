{
  description = "booklearner's nix configuration flake";

  inputs = {
    # tracking nixpkg repositories
    nixpkgs.url = "github:NixOS/nixpkgs/master";
    nixos-stable.url = "github:NixOS/nixpkgs/release-22.11";
    nixos-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-darwin.url = "github:NixOS/nixpkgs/nixpkgs-22.11-darwin";

    # nix-darwin inputs, https://github.com/LnL7/nix-darwin
    darwin.url = "github:lnl7/nix-darwin/master";
    darwin.inputs.nixpkgs.follows = "nixpkgs-darwin";

    # home-manager inputs, https://github.com/nix-community/home-manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ darwin, home-manager, nixpkgs, nixpkgs-darwin, ... }: {
    # macbook configuration
    darwinConfigurations."terminal" = darwin.lib.darwinSystem {
      system = "x86_64-darwin";
      inputs = { inherit darwin home-manager nixpkgs nixpkgs-darwin; };
      modules = [
        ./hosts/terminal.nix
      ];
    };

    # hetzner bare-metal configuration
    nixosConfigurations."mainframe" = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      inputs = { inherit home-manager nixpkgs; };
      modules = [
        ./hosts/mainframe.nix
      ];
    };
  };
}
