{ config, lib, pkgs, ... }:

{
  options = {
    services.vpn = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "";
      };
      serverConfigFile = lib.mkOption {
        type = lib.types.str;
        default = "/etc/vpn/server.conf";
        description = "Path to the VPN server configuration file.";
      };
      clientConfigDir = lib.mkOption {
        type = lib.types.str;
        default = "/etc/vpn/clients/";
        description = "Directory for VPN configuration files.";
      };
      # Add more VPN configuration options here as needed.
    };
  };

  config = lib.mkIf config.services.vpn.enable {
    systemd.services.vpn = {
      description = "VPN Service";
      after = ["network-online.target"];
      serviceConfig = {
        # Customize the VPN service configuration here.
      };
    };
  };
}
