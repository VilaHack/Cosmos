{
  fetchFromGitHub,
  rustPlatform,
  pkgconf,
  openssl,
}:

let
  package_name = "Horizon";
  version = "0.1.2";
in
rustPlatform.buildRustPackage {
  name = package_name;
  pname = package_name;
  version = version;

  src = fetchFromGitHub {
    owner = "VilaHack";
    repo = package_name;
    tag = version;
    hash = "sha256-8zu/MA1GtskH27NGl/Qoj0WcLdLHvJPuXRVTxiugxUo=";
  };

  nativeBuildInputs = [ pkgconf ];
  buildInputs = [ openssl ];
  cargoHash = "sha256-Z1WFgVx6wQwRB0VRCStey5iB2A7dukoSzUNDyTBvAkU=";
}
