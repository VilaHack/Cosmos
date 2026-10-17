{
  fetchFromGitHub,
  rustPlatform,
  postgresql,
  pkgconf,
  openssl,
  bash,
  nix,
}:

let
  package_name = "Horizon";
  version = "0.1.1";
in
rustPlatform.buildRustPackage {
  name = package_name;
  pname = package_name;
  version = version;

  src = fetchFromGitHub {
    owner = "VilaHack";
    repo = package_name;
    tag = version;
    hash = "sha256-BMfdGylvWvQTGTmTbJbyBcGmqvXtyU12ZoEetRtCeEc=";
  };

  nativeBuildInputs = [ pkgconf ];
  buildInputs = [ openssl ];
  cargoHash = "sha256-hnxhop7dvxtjsLDAZ8n5+PQPo9rozUkmOKoAl8jA7ws=";
}
