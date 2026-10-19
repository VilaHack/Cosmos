{
  services.nginx.virtualHosts."vilahack.com" = {
    kTLS = true;
    forceSSL = true;
    useACMEHost = "vilahack.com";
    extraConfig = "limit_req zone=web burst=20 nodelay;";

    locations."/mail".proxyPass = "http://10.1.0.3:82";
    locations."/".proxyPass = "http://10.1.0.2:80";
  };
}
