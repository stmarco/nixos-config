{ config, pkgs, ... }:

{
    home.username = "marco";
    home.homeDirectory = "/home/marco";
    home.stateVersion = "25.11";
    programs.bash = {
        enable = true;
        shellAliases = {
            btw = "echo I use hyprland on NixOS btw";
        };
        profileExtra = ''
        if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
        exec uwsm start -S hyprland-uwsm.desktop
        fi
        '';
    };
}