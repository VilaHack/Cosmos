{
  services.openssh = {
    enable = true;
    # Listen to ssh only from inside the LAN. This avoids SSH being accessible from the public address.
    listenAddresses = [
      {
        addr = "10.1.0.1";
        port = 22;
      }
    ];

    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      PermitRootLogin = "no";
      AllowUsers = [ "pol-epsevg" ];
      MaxAuthTries = 3;
      PerSourcePenalties = "crash:30s authfail:30s max:86400s";
    };
  };
}
