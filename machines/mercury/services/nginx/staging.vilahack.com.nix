{
  services.nginx.virtualHosts."staging.vilahack.com" = {
    kTLS = true;
    forceSSL = true;
    useACMEHost = "vilahack.com";
    extraConfig = "limit_req zone=api burst=100 nodelay;";
    listen = [
      {
        addr = "10.1.0.1";
        port = 443;
        ssl = true;
      }
    ];

    locations."/api".proxyPass = "http://10.1.0.4:8001";
  };
}
