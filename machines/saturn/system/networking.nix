{
  systemd.network.networks."internal".address = [ "10.1.0.6/16" ];

  networking = {
    hostName = "saturn";

    firewall.allowedTCPPorts = [
      8005 # grafana
      4317 # opentelemetrycollector
    ];
  };
}
