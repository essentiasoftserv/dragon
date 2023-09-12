with (import <nixpkgs> {});

mkShell {
  buildInputs = [
    openldap
    openvpn
    git
  ];
}

shellHook = ''
	echo -e "SHELL ACTIVATED"
	# add other service and shell commands here 

'';

}
