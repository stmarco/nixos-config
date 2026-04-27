{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

   networking.hostName = "nixos-hyprland"; # Define your hostname.
   networking.networkmanager.enable = true;
   
   time.timeZone = "Europe/Brussels";

    services.getty.autologinUser = "marco";
    programs.hyprland = {
        enable = true;
        xwayland.enable = true;
        withUWSM = true; #deprecated
    };
 users.users.marco = {
   isNormalUser = true;
   extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
   packages = with pkgs; [
     tree
   ];
 };

  programs.firefox.enable = true;

 environment.systemPackages = with pkgs; [
   vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
   wget
   foot
   kitty
   waybar
   git
   hyprpaper
 ];

 services.openssh.enable = true;

    nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "25.11"; # Did you read the comment?

}
