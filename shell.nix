{ pkgs ? import <nixpkgs> {}, ... }:
let
  packages = with pkgs; [
    # stdenv.cc.cc
    libgcc ccache automake
    SDL2 libdrm libgbm
    tcl expect libxml2
    qemu libisoburn gptfdisk e2tools
    byacc autoconf269 autogen bison flex gperf libxslt
    gnat14 gmp pkg-config expat ncurses zlib
  ];
in 
pkgs.mkShell {
  
  NIX_LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath packages;
  # NIX_LD_LIBRARY_PATH = with pkgs; lib.makeLibraryPath [ flex ];
  
  # NIX_LD_LIBRARY_PATH = with pkgs; lib.makeLibraryPath [
  #   SDL2
  #   libgcc libdrm libgbm
  #   libxml2 libisoburn
  #   libxslt gmp
  #   # stdenv.cc.cc
  #   # openssl
  #   # ...
  # ];
  
  nativeBuildInputs = packages;
  
  buildInputs = packages;
  
  inherit packages;
}
