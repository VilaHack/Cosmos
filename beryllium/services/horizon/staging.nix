{ config, pkgs, ... }:

let
  horizon = pkgs.callPackage ./package/staging.nix { };

in
{
  systemd.services.horizon_staging = {
    description = "Horizon Staging";

    wantedBy = [ "multi-user.target" ];
    requires = [ "network-online.target" ];

    serviceConfig = {
      ExecStart = "${horizon}/bin/horizon /etc/horizon/staging.toml";
      Restart = "always";

      User = "horizon_staging";
      Group = "services";

      StateDirectory = "vilahack_backend";
      Environment = "HOME=/var/lib/vilahack_backend";
    };
  };

  users.users.horizon_staging = {
    isSystemUser = true;
    group = "services";
  };
}
