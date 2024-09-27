# Development

Use [tart](https://tart.run) to create a MacOS virtual machine.

```sh
tart clone ghcr.io/cirruslabs/macos-sonoma-vanilla:latest nix-darwin
tart set nix-darwin --disk-size 100
tart run nix-darwin
```

ssh into dev machine

```sh
ssh admin@$(tart ip nix-darwin) # will need a new terminal
```

Need to resize the partition in the guest MacOS

```sh
diskutil repairDisk disk0
diskutil apfs resizeContainer disk0s2 0
```

## Clean up once done with the VM

```sh
tart delete nix-darwin
```

# Bootstrapping

Install nix

```sh
sh <(curl -L https://releases.nixos.org/nix/nix-2.24.8/install) --daemon
```

open a dev shell

```sh
# cd to flake location
cd /Volumes/nix-darwin
nix develop --extra-experimental-features 'nix-command flakes'
```

```sh
just repl
```

bootstrap

```sh
just init yellow4 # hostname
```

# Update system

Rebuild flake

```sh
just rebuild
```
