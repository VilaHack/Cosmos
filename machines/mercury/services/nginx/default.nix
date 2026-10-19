{
  imports = [
    ./vilahack.com.nix

    ./chat.vilahack.com.nix
    ./docs.api.vilahack.com.nix
    ./hub.vilahack.com.nix
    ./kanban.vilahack.com.nix
    ./staging.vilahack.com.nix
  ];

  users.users.nginx.extraGroups = [ "acme" ];

  services.nginx = {
    enable = true;
    appendHttpConfig = ''
      limit_req_zone $binary_remote_addr zone=web:10m rate=100r/s;
      limit_req_zone $binary_remote_addr zone=api:10m rate=25r/s;

      map $ssl_early_data $tls1_3_early_data {
        "~." $ssl_early_data;
        default "";
      }
    '';

    upstreams."mattermost_backend" = {
      servers = { "10.1.0.3:8065" = {}; };
      extraConfig = "keepalive 32;";
    };
  };
}
