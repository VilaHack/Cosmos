{
  services.nginx.virtualHosts."grafana.vilahack.com" = {
    kTLS = true;
    forceSSL = true;
    useACMEHost = "vilahack.com";
    extraConfig = "limit_req zone=web burst=200 nodelay;";
    locations."/" = {
      proxyPass = "http://127.0.0.1:8005";
      proxyWebsockets = true;
      recommendedProxySettings = true;
    };
  };
}
