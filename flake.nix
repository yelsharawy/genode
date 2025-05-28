{
  description = "Environment for Genode development";
  
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nix-ld.url = "github:Mic92/nix-ld";
    # this line assume that you also have nixpkgs as an input
    nix-ld.inputs.nixpkgs.follows = "nixpkgs";
  };
  
  outputs = { self, nixpkgs, nix-ld, ... }@inputs:
  let
    pkgs = nixpkgs.legacyPackages."x86_64-linux";
  in
  {
    
    devShells."x86_64-linux".default =
      # pkgs.mkShell {
      #   packages = with pkgs; [
      #     SDL2 libdrm libgbm
      #     tcl expect libxml2
      #     qemu libisoburn gptfdisk e2tools
      #     byacc autoconf264 autogen bison flex gperf libxslt
      #   ];
      # };
      import ./shell.nix { inherit pkgs; };
    
  };
}