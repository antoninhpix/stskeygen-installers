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
      bin-version = "3.1.0";
      host = "https://ce-installation-binaries.s3.us-east-1.amazonaws.com";
      uri =
        "${host}/${bin-name}/${bin-version}/${bin-name}_${bin-version}_#PLATFORM_ARCH#.tar.gz";
      stskeygen-packages = {
        "aarch64-darwin" = {
          url = builtins.replaceStrings [ "#PLATFORM_ARCH#" ] [ "darwin_arm64" ]
            uri;
          sha256 =
            "5df88ff0fa5f2c0c34b0cc730fc7744760c356b987aca3ea216cf43c6922e33a";
        };
        "x86_64-darwin" = {
          url = builtins.replaceStrings [ "#PLATFORM_ARCH#" ] [ "darwin_amd64" ]
            uri;
          sha256 =
            "893f7169ffbcba56d3296b4d0373a321c8ccf404faf220d698d5c245d36f935d";
        };
        "x86_64-linux" = {
          url =
            builtins.replaceStrings [ "#PLATFORM_ARCH#" ] [ "linux_amd64" ] uri;
          sha256 =
            "2df462d099a11f3d43333a6b536e87f73c4b691b3bdc3ec2569c22973efb4d1a";
        };
        "aarch64-linux" = {
          url =
            builtins.replaceStrings [ "#PLATFORM_ARCH#" ] [ "linux_arm64" ] uri;
          sha256 =
            "e51eee0f8046b17068658042a7e5a27a23ffd1773aafa42e2db96dfb88fa94b4";
        };
      };
    in utils.lib.eachSystem (builtins.attrNames stskeygen-packages) (system:
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
          };
        };
        packages.default = packages.${bin-name};
      });
}
