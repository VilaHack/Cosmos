{
  users.users.nginx.extraGroups = [ "acme" ];

  services.nginx = {
    enable = true;
    appendHttpConfig = ''
      limit_req_zone $binary_remote_addr zone=web:10m rate=100r/s;
      limit_req_zone $binary_remote_addr zone=api:10m rate=25r/s;
    '';

    virtualHosts."chat.vilahack.com" = {
      kTLS = true;
      forceSSL = true;
      useACMEHost = "vilahack.com";
      extraConfig = "limit_req zone=web burst=20 nodelay;";

      locations."/".proxyPass = "http://10.1.0.3:8065";
    };

    virtualHosts."docs.api.vilahack.com" = {
      kTLS = true;
      forceSSL = true;
      useACMEHost = "vilahack.com";
      extraConfig = "limit_req zone=web burst=20 nodelay;";

      locations."/".proxyPass = "http://10.1.0.3:81";
    };

    virtualHosts."hub.vilahack.com" = {
      kTLS = true;
      forceSSL = true;
      useACMEHost = "vilahack.com";
      extraConfig = "limit_req zone=web burst=20 nodelay;";

      locations."/".proxyPass = "http://10.1.0.3:80";
    };

    virtualHosts."kanban.vilahack.com" = {
      kTLS = true;
      forceSSL = true;
      useACMEHost = "vilahack.com";
      extraConfig = "limit_req zone=web burst=20 nodelay;";

      locations."/".proxyPass = "http://10.1.0.3:8002";
    };
  };
}
