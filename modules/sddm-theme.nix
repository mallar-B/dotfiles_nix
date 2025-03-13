{pkgs}:
pkgs.stdenv.mkDerivation {
  name = "sddm-slice";
  src = pkgs.fetchFromGitHub {
    owner = "EricKotato";
    repo = "sddm-slice";
    rev = "98996b49e0d5657f94cc0cfb71480da76c83b008";
    sha256 = "1mnv7y66i0hh9svnvv69rx1q92qzb3spqbqvvxb7mz75wn20fa7r";
  };
  installPhase = ''
    mkdir -p $out
    cp -Ra ./* $out/
  '';
}
