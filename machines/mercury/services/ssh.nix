{
  services.openssh = {
    # Listen to ssh only from inside the LAN. This avoids SSH being accessible from the public address.
    listenAddresses = [
      {
        addr = "10.1.0.1";
        port = 22;
      }
    ];
  };
}
