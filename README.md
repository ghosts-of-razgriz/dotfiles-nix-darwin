# Development

Use [tart](https://tart.run) to create a MacOS virtual machine.

```sh
tart clone ghcr.io/cirruslabs/macos-sequoia-vanilla:latest nix-darwin
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
# may not work
open 'smb://user:password@192.168.64.1/nix-darwin'
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

## Post Bootstrap

After bootstrapping, the system should be 90% ready. There are some [Manual Steps](./manual-steps.md) and need to be completed, which are not scriptable.

# Update system

Rebuild flake

```sh
just rebuild
```
