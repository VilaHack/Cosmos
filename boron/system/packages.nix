{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    neovim
    curl
    tmux
    unixtools.netstat
    rsync
  ];

  programs.nano.enable = false;
}
