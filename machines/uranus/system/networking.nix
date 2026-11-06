{
  systemd.network.networks."internal".address = [ "10.1.0.7/16" ];

  networking = {
    hostName = "mars";

    firewall.allowedTCPPorts = [  ];
  };
}
