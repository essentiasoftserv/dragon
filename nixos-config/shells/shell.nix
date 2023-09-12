with (import <nixpkgs> {});

mkShell {
  buildInputs = [
    openldap
    openvpn
    git
  ];
}

shellHook = ''
	GREEN='\033[0;32m'
 	RESET='\033[0m'
	echo -e "$GREEN SHELL ACTIVATED $RESET"
	# add other service and shell commands here  
'';

}
