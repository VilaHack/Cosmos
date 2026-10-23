{
  systemd.network.networks."internal".address = [ "10.1.0.4/16" ];

  networking = {
    hostName = "mars";

    firewall.allowedTCPPorts = [
      8001 # Staging backend
    ];
  };
}
