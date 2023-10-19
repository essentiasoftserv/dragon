# This setup is mainly targeted for users with *Non-nix* based systems 

1. ## Nix package manager install
   * First you are going to need to install the nix package manger  
   * To be able to install need refer to the project README.md file

2. ## Git clone the project repository
   * Git clone the project repo in your desired folder using the following command 
  
   ```bash
   git clone https://github.com/essentiasoftserv/dragon.git
   ```

3. ## Run the nix-shell 

   * Go to the nix-config/shells/shell.nix
   * Run the command using 
     ```nix 
     nix-shell shell.nix
     ```
4. ## Access the docker containers

   * To access the docker containers you have to just open localhost followed by the port

   * Here are the port bindings-->
     
     * OpenIAM - localhost:8080
     * Jenkins - localhost:8000
     * Grafana - localhost:3000

5. ## Using the registry

   * To use the docker registry you have to run the following command 

   ```bash
   sudo docker tag <image-name> localhost:5000/<name>
   sudo docker push localhost:5000/<name>
   ```
   * To download from the registry just run the following

   ```bash
   sudo docker pull localhost:5000/<name>
   ```


## ERRORS

 * If you encounter any docker container related issues you could check the docker containers using the command
 ```bash
sudo docker ps -a 
 ```
 * For further information related to docker you could check out their documentation
   https://docs.docker.com