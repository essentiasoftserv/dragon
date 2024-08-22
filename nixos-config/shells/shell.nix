with (import <nixpkgs> {});

mkShell {
  buildInputs = [
    openldap
    openvpn
    git
    pkgs.qrencode
    pkgs.docker 
    pkgs.postgresql_15_jit
    wireguard-tools
  ];


shellHook = ''
	GREEN='\033[0;32m'
 	RESET='\033[0m'
	echo -e "$GREEN SHELL ACTIVATED $RESET"
  sudo docker-compose up -d
  sudo wg-quick up wg0
	# add other service and shell commands here  
'';

}
