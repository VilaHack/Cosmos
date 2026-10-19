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
        {
          name = "joel";
          publicKey = "Q5xTDJz9ZtXDkxrQT7hQ9uVOIh3B7jC12aagUWtnjTo=";
          presharedKeyFile = "/etc/wireguard/preshared_key";
          allowedIPs = [ "10.0.0.4/32" ];
        }
        {
          name = "ruben-laptop";
          publicKey = "XyDX9xbbMGufnvIVKL466alUIP1/4W1kKGuJ7LzSIgs=";
          presharedKeyFile = "/etc/wireguard/preshared_key";
          allowedIPs = [ "10.0.0.5/32" ];
        }
        {
          name = "ruben-pc";
          publicKey = "m2jPZvh8wI5yB71zh7uLJ6n9uTRk8/Eqn2X0KEorM0I=";
          presharedKeyFile = "/etc/wireguard/preshared_key";
          allowedIPs = [ "10.0.0.6/32" ];
        }
        {
          name = "yazide-mac";
          publicKey = "55+4/7WPYvzluFvdf1Pn2Ng8H9ImFSetEvnp/V7Yww=";
          presharedKeyFile = "/etc/wireguard/preshared_key";
          allowedIPs = [ "10.0.0.7/32" ];
        }
      ];
    };
  };
}
