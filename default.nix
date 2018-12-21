with import <nixpkgs> {};
{ stable ? import (fetchFromGitHub {
    owner = "NixOS";
    repo = "nixpkgs-channels";
    rev = "db561c90ef34cc64287ee1c366ab9eec85b2af50";
    sha256 = "06114dqsd401c6vi6iqzxvp1c1s6g1ganhx65ph2ng06q7chggh9";
  }) {}
}:

stdenv.mkDerivation rec {
  name = "env";
  env = buildEnv { name = name; paths = buildInputs; };
  buildInputs = [
    stable.entr
    stable.fd
    stable.nodejs-10_x
  ];
}
