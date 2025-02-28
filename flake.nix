{
  description =
    "A commandline utility for trading directory service credentials (such as AD username and password) for AWS STS Keys.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, utils }:
    let
      bin-name = "stskeygen";
      bin-version = "3.1.1";
      host = "https://ce-installation-binaries.s3.us-east-1.amazonaws.com";
      uri =
        "${host}/${bin-name}/${bin-version}/${bin-name}_${bin-version}_#PLATFORM_ARCH#.tar.gz";
      stskeygen-packages = {
        "aarch64-darwin" = {
          url = builtins.replaceStrings [ "#PLATFORM_ARCH#" ] [ "darwin_arm64" ]
            uri;
          sha256 =
            "f27872b3c40a5b1868d12bcd537f67d63e73b0a79fe886c1f996342cfa668c34";
        };
        "x86_64-darwin" = {
          url = builtins.replaceStrings [ "#PLATFORM_ARCH#" ] [ "darwin_amd64" ]
            uri;
          sha256 =
            "5344f0c3b2709310e0852756dfb2d0edc4693ee5439983e1eea974a224122d87";
        };
        "x86_64-linux" = {
          url =
            builtins.replaceStrings [ "#PLATFORM_ARCH#" ] [ "linux_amd64" ] uri;
          sha256 =
            "d12906d83aa204f51efcfa6d44e63d1695260b98d2d22d3c414584407bd608aa";
        };
        "aarch64-linux" = {
          url =
            builtins.replaceStrings [ "#PLATFORM_ARCH#" ] [ "linux_arm64" ] uri;
          sha256 =
            "5a2b3561cd679f1ad5125884479b2f552e389eef7a894e302a6216c9143912f2";
        };
      };
      compatible-systems = builtins.attrNames stskeygen-packages;
    in utils.lib.eachSystem compatible-systems (system:
      let pkgs = import nixpkgs { inherit system; };
      in with pkgs; rec {
        packages.${bin-name} = stdenv.mkDerivation {
          pname = bin-name;
          version = bin-version;
          src = fetchurl stskeygen-packages.${system};
          sourceRoot = ".";
          installPhase = ''
            install -m755 -D ${bin-name} $out/bin/${bin-name}
          '';
          meta = with lib; {
            homepage =
              "https://cimpress-support.atlassian.net/wiki/spaces/CloudKB/pages/15058567646/Generating+STS+access+keys+via+Auth0";
            description =
              "A commandline utility for trading directory service credentials (such as AD username and password) for AWS STS Keys.";
            licences = licences.mit;
            platforms = compatible-systems;
          };
        };
        packages.default = packages.${bin-name};
      });
}
