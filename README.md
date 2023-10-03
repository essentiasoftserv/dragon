It was great starting with the nixos, but after sometime stuck on the installation, build and run the code. 

I am using mac os, and while installing it the package stuck in the middle. so I follow the simple steps for installation and tha help alot while installation. 
- Start with the command line 
    - open terminal and run `sh <(curl -L https://nixos.org/nix/install) --daemon`
after successful installation try to run `nix command`
    - I am hoping it is falling for you also 
    - goto your bashrc or zshrc and check the below lines are there or not 

```
# Nix
if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
  . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi
# End Nix


export PATH="$PATH:/nix/var/nix/profiles/default/bin"
```
   - if not then add the lines and restart your terminal using `zsh or bash`
   - its time to try again: try with `nix`
   Hope nix is working fine then we will move to next steps
After succesfull installation we need to `experimental-features = nix-command flakes` line inside `/etc/nix/nix.conf`.

once it done, we will test the configuration using a `hello word` print.
- Open your terminal
- run `nix run nixpkgs#hello`
- make sure you have internet
- it will download the remote file and print `hello world !`
- cheers !!!

some more commands:
- `nix shell 'nixpkgs#hello'`
- `nix run 'nixpkgs#hello'`
- `nix build`
- `nix flake show`
- `nix flake init`
- `nix develop`

