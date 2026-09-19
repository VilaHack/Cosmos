{ pkgs, ... }:

{
  networking.wireguard = {
    useNetworkd = true;

    interfaces.wg0 = {
      ips = [ "10.0.0.1/16" ]; # End of tunnel interface IP and mask
      listenPort = 51820;

      privateKeyFile = "/etc/wireguard/private";

      peers = [
        {
          name = "pol-epsevg-framework-12";
          publicKey = "VWY/9KPM/jThicYamR3050LIKmTP/Klubgj1PbYBjkM=";
          presharedKeyFile = "/etc/wireguard/preshared_key";
          allowedIPs = [ "10.0.0.2/32" ];
        }
        {
          name = "pol-epsevg-pc";
          publicKey = "qqinyOMi2zfUExNUX9JsebOR1N932gTGGoei7/yr33Q=";
          presharedKeyFile = "/etc/wireguard/preshared_key";
          allowedIPs = [ "10.0.0.3/32" ];
        }
      ];
    };
  };
}
