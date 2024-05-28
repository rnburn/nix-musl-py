{ pkgs }:
let
  lib = pkgs.lib;
in
pkgs.mkShell {
  buildInputs = [
    (pkgs.python311.withPackages(ps: with ps; [
      numpy
      scipy
      sympy
      matplotlib
      jupyter
      ipython
    ]))
  ];
  shellHook = ''
  '';
}
