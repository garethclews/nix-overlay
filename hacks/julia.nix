# This derivation is created because of issues with Arpack.jl compiling on nixOS.
# 0. edit the below to match the version of julia you want
# 1. nix-build
# 2. /nix/store/*julia-env/bin/julia
# 3. install and compile Arpack
# 4. revert to your usual julia

with import <nixpkgs> { };

let
  extraLibs = [
    arpack
    gfortran.cc
    (pkgs.runCommand "openblas64_" { } ''
      mkdir -p "$out"/lib/
      ln -s ${openblasCompat}/lib/libopenblas.so "$out"/lib/libopenblas64_.so.0
    '')
  ];
in stdenv.mkDerivation rec {
  name = "julia-env";
  version = julia.version;
  nativeBuildInputs = [ makeWrapper cacert git pkgconfig which ];
  buildInputs = [ julia_11 ] ++ extraLibs;
  phases = "installPhase";
  installPhase = ''
    export LD_LIBRARY_PATH=${lib.makeLibraryPath extraLibs}
    makeWrapper ${julia}/bin/julia $out/bin/julia \
        --prefix LD_LIBRARY_PATH : "$LD_LIBRARY_PATH" \
        --set JULIA_PKGDIR $JULIA_PKGDIR
  '';
}
