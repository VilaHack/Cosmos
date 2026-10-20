{
  services.prometheus = {
    enable = true;

    # exporters = {
    #   node = {
    #     enable = true;
    #     port = 10002;
    #     group = "services";
    #   };
    # };

    globalConfig.scrape_interval = "1m";
    
    scrapeConfigs = [
      # {
      #   job_name = "node";
      #   static_configs = [{
      #     targets = [ "localhost:10002" ];
      #   }];
      # }
      {
        job_name = "opentelemetry";
        static_configs = [{
          targets = [ "localhost:9090" ];
        }];
      }
    ];
  };
}
