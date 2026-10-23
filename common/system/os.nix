{
  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 2d";
    };

    optimise.automatic = true;
  };

  system.stateVersion = "26.05";
}
