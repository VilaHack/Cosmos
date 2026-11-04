{
  services.prometheus = {
    enable = true;

    globalConfig.scrape_interval = "1m";

    scrapeConfigs = [
      {
        job_name = "node";
        static_configs = [
          {
            targets = [
              "10.1.0.1:9100"
              "10.1.0.2:9100"
              "10.1.0.3:9100"
              "10.1.0.4:9100"
              "10.1.0.5:9100"
              "10.1.0.6:9100"
              "10.1.0.7:9100"
              # "10.1.0.8:9100"
              "10.1.0.9:9100"
            ];
          }
        ];
      }

      {
        job_name = "opentelemetry";
        static_configs = [
          {
            targets = [ "localhost:9000" ];
          }
        ];
      }
    ];
  };
}
