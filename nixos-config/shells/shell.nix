with (import <nixpkgs> {});

mkShell {
  buildInputs = [
    openldap
    openvpn
    git
    pkgs.docker 
    pkgs.postgresql_15_jit
    wireguard-tools
  ];


shellHook = ''
	GREEN='\033[0;32m'
 	RESET='\033[0m'
	echo -e "$GREEN SHELL ACTIVATED $RESET"
  sudo docker pull openidentityplatform/openam jenkins/jenkins:lts postgres registry:2 grafana/grafana
  sudo docker run -d -p 8080:8080 --name=openam openidentityplatform/openam
  sudo docker run -d -p 8000:8080 --name=jenkins jenkins/jenkins:lts 
  sudo docker run -d -p 5000:5000 --name=registry registry:2
  sudo docker run -d -p 3000:3000 --name=grafana grafana/grafana
  echo -e "$GREEN All the docker containers are running $RESET"
	# add other service and shell commands here  
'';

}
