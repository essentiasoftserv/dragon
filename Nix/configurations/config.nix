# my-config.nix

{ config, lib, ... }:

{
  # Specify hostname
  networking.hostName = "my-nixos-machine";

  # Configure time zone
  time.timeZone = "UTC";

  # Define users and other system configurations
  users.users.vansha = {
    isNormalUser = true;
    description = "Vansha Aggarwal";
    extraGroups = [ "wheel" ];
  };

  # Enable networking and network services
  networking.networkmanager.enable = true;
  services.sshd.enable = true;
}
