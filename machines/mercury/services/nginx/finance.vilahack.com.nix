{
  services.nginx.virtualHosts."finance.vilahack.com" = {
    kTLS = true;
    forceSSL = true;
    useACMEHost = "vilahack.com";
    extraConfig = "limit_req zone=web burst=20 nodelay;";

    # This file has to be created manually!
    basicAuthFile = "/etc/nginx/.htpasswd_finance";

    locations."/".proxyPass = "http://10.1.0.3:83";
  };
}
