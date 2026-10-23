{
  systemd.network.networks."internal".address = [ "10.1.0.2/16" ];

  networking = {
    hostName = "venus";

    firewall.allowedTCPPorts = [
      80
    ];
  };
}
