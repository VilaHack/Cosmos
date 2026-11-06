{ lib, config, ... }:

{
  services.prometheus.exporters.node = {
    enable = true;
    openFirewall = true;
    group = "services";
  } // lib.optionalAttrs (config.networking.hostName == "mercury") {
    listenAddress = "10.1.0.1";
    firewallFilter = "-i ens19 -p tcp -m tcp --dport 9100";
  } // lib.optionalAttrs (config.networking.hostName == "neptune") {
    listenAddress = "10.1.0.8";
    firewallFilter = "-i ens18 -p tcp -m tcp --dport 9100";
  };
}
