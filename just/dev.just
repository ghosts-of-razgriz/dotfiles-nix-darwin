import 'commands.just'

list:
    @just --list dev

setup:
    tart clone ghcr.io/cirruslabs/macos-sequoia-vanilla:latest nix-darwin
    tart set nix-darwin --disk-size 100
    @just dev::up
    @just dev::wait_until_ready
    {{ dev_run }} 'echo y | diskutil repairDisk $({{ get_disk }})'
    {{ dev_run }} 'diskutil apfs resizeContainer $({{ get_disk_part }}) 0'

debug:
    {{ dev_run }} 'echo $(pwd)'

up:
    tart run nix-darwin > /tmp/tart.log 2>&1 &

stop:
    -tart stop nix-darwin

rm: stop
    -tart delete nix-darwin

ssh:
    -{{ dev_run }}

[private]
wait_until_ready:
    #!/usr/bin/env bash
    until {{ dev_run }} 'exit 0' 2>/dev/null
    do
    	echo 'vm not ready...'
    	sleep 5
    done
