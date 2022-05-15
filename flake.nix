{
  description = "booklearner's nix configuration flake";

  inputs = {
    # branches to track nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs";
    nixpkgs-darwin.url = "github:nixos/nixpkgs/nixpkgs-21.11-darwin";

    # nix-darwin inputs, https://github.com/LnL7/nix-darwin
    darwin.url = "github:lnl7/nix-darwin/master";
    darwin.inputs.nixpkgs.follows = "nixpkgs";

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
