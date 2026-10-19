{
  services.nginx.virtualHosts."chat.vilahack.com" = {
    # Adapted from https://docs.mattermost.com/deployment-guide/server/setup-nginx-proxy
    kTLS = true;
    forceSSL = true;
    useACMEHost = "vilahack.com";

    extraConfig = ''
      limit_req zone=web burst=20 nodelay;

      ssl_session_timeout 1d;
      ssl_protocols TLSv1.2 TLSv1.3;
      ssl_early_data on;
      ssl_ciphers 'ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:ECDHE-ECDSA-AES256-SHA384:ECDHE-RSA-AES256-SHA384';
      ssl_prefer_server_ciphers on;
      ssl_session_cache shared:SSL:50m;

      add_header Strict-Transport-Security max-age=15768000;
      add_header X-Early-Data $tls1_3_early_data;

      ssl_stapling on;
      ssl_stapling_verify on;
    '';

    locations."~ /api/v[0-9]+/(users/)?websocket$" = {
      proxyPass = "http://mattermost_backend";
      proxyWebsockets = true;
      extraConfig = ''
        client_max_body_size 50M;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_set_header X-Frame-Options SAMEORIGIN;
        proxy_buffers 256 16k;
        proxy_buffer_size 16k;
        client_body_timeout 60s;
        send_timeout 300s;
        lingering_timeout 5s;
        proxy_connect_timeout 90s;
        proxy_send_timeout 300s;
        proxy_read_timeout 90s;
      '';
    };

    locations."/" = {
      proxyPass = "http://mattermost_backend";
      extraConfig = ''
        client_max_body_size 100M;
        proxy_set_header Connection "";
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_set_header X-Frame-Options SAMEORIGIN;
        proxy_buffers 256 16k;
        proxy_buffer_size 16k;
        proxy_read_timeout 600s;
        proxy_http_version 1.1;
      '';
    };
  };
}
