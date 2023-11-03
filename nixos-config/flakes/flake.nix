{
  description = "My NixOS Flake";
  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/nixpkgs-unstable;  # Use a specific Nixpkgs channel.
  };

  outputs = { self, nixpkgs }: {
    nixosConfigurations.mySystem = nixpkgs.lib.nixosSystem {
      system = "aarch64-linux";  # Replace with your target system architecture.
      modules = [
        ../configuration.nix  # Include your NixOS configuration here.
      ];
    };
  };
}
