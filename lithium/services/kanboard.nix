{
  services.kanboard = {
    enable = true;
    nginx.listen = [
      {
        addr = "0.0.0.0";
        port = 8002;
      }
    ];
  };
}
