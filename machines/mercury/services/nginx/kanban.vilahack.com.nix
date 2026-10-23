{
  services.nginx.virtualHosts."kanban.vilahack.com" = {
    kTLS = true;
    forceSSL = true;
    useACMEHost = "vilahack.com";
    extraConfig = "limit_req zone=web burst=20 nodelay;";

    locations."/".proxyPass = "http://10.1.0.3:8002";
  };
}
