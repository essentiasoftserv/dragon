{ config, lib, pkgs, ... }:

{
  options = {
    services.openldap = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
        description = "Whether to enable the OpenLDAP service for basic access management.";
      };
      user = lib.mkOption {
        type = lib.types.str;
        default = "openldap";
        description = "User account under which slapd runs.";
      };
      group = lib.mkOption {
        type = lib.types.str;
        default = "openldap";
        description = "Group account under which slapd runs.";
      };
      urlList = lib.mkOption {
        type = lib.types.listOf lib.types.str;
        default = ["ldap:///"];
        description = "URL list slapd should listen on.";
      };
    };
  };

  config = lib.mkIf config.services.openldap.enable {
    users.users = {
      openldap = {
        group = config.services.openldap.group;
        isSystemUser = true;
      };
    };
    systemd.services.openldap = {
      description = "OpenLDAP Server Daemon";
      wantedBy = ["multi-user.target"];
      after = ["network-online.target"];
      serviceConfig = {
        User = config.services.openldap.user;
        Group = config.services.openldap.group;
        ExecStart = "${pkgs.openldap}/libexec/slapd -d 0 -h ${lib.concatStringsSep(" ", config.services.openldap.urlList)}";
        Type = "notify";
        NotifyAccess = "all";
      };
    };
  };
}
