with (import <nixpkgs> {});

mkShell {
  buildInputs = [
    openldap
    openvpn
    git
    pkgs.jenkins
  ];


shellHook = ''
	GREEN='\033[0;32m'
 	RESET='\033[0m'
	echo -e "$GREEN SHELL ACTIVATED $RESET"
  sudo systemctl start openvpn
  sudo openvpn ../openvpn-config/shell/example-config.ovpn
	# add other service and shell commands here  
'';

}
