{ lib
, rustPlatform
, fetchFromGitHub
, pkg-config
, openssl
, stdenv
}:

rustPlatform.buildRustPackage rec {
  pname = "emmylua-ls";
  version = "0.11.0";

  src = fetchFromGitHub {
    owner = "EmmyLua";
    repo = "emmylua-analyzer-rust";
    rev = "${version}";
    hash = "sha256-HbjGOvK/b7SyhNF/Jff0SgJdOfSbzjkDkqQwuflOABA=";
  };

  cargoHash = "sha256-3x71VNWCTFb75STx8w/T++dLo1s2FwNhFm+lyZHS7qI=";

  nativeBuildInputs = [
    pkg-config
  ];

  buildInputs = [
    openssl
  ] ++ lib.optionals stdenv.isDarwin [
  ];

  meta = with lib; {
    description = "EmmyLua Language Server implementation in Rust";
    homepage = "https://github.com/EmmyLua/emmylua-analyzer-rust";
    license = licenses.mit;
    maintainers = [ ];
    platforms = platforms.all;
  };
}