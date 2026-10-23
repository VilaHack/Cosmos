{ lib, config, ... }:

{
  services.openssh = {
    enable = true;
    # SSH config is defined differently for mercury since it faces the public internet
    openFirewall = lib.mkIf (config.networking.hostName != "mercury") true;

    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      PermitRootLogin = "no";
      AllowUsers = lib.attrNames (lib.filterAttrs (_: user: user.isNormalUser) config.users.users);
      MaxAuthTries = 3;
      PerSourcePenalties = "crash:30s authfail:30s max:86400s";
    };
  };
}
