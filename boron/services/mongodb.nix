{ pkgs, lib, ... }:

{
  # The SSPL-1.0 is considered "unfree" by the OSI for "being discriminatory to commercial users".
  #
  # From what I understand, the SSPL-1.0 is mostly AGPLv3, but with some changes to a couple
  # clauses. The changes make it so companies like Amazon can't sell MongoDB instances on AWS
  # and not contribute anything back.
  #
  # The code is still free to read, copy, modify and redistribute. I think this maintains the
  # open source essence. The added clauses also obviously don't affect us. Not only because
  # we're not selling mongodb instances as a service, but even if we did, our entire
  # infrastructure is open source, so we'd be abiding by the license terms.
  nixpkgs.config.allowlistedLicenses = with lib.licenses; [ sspl ];

  services.mongodb = {
    enable = true;
    bind_ip = "10.1.0.5";

    package = pkgs.mongodb-ce;
  };
}
