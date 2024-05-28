{
  description = "example";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };
  outputs = { self, nixpkgs }:
    let
      system-linux = "x86_64-linux";
      pkgs-linux = import nixpkgs { 
        system = system-linux;
      };
    in
    {
      formatter.${system-linux} = pkgs-linux.nixpkgs-fmt;
      devShells.${system-linux}.default = import ./nix/shell.nix {
        pkgs = pkgs-linux.pkgsMusl;
      };
    };
}
