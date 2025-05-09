import 'commands.just'

dev_sshpass := 'sshpass -p admin'

dev_run := dev_sshpass + " " + ssh_run + " -l admin $(tart ip nix-darwin)"

get_disk_part := 'diskutil list | grep "Apple_APFS Container" | awk "{print \$NF}"'

get_disk := get_disk_part + ' | sed "s/s[0-9]*\$//"'


list:
	@just --list dev

setup:
	tart clone ghcr.io/cirruslabs/macos-sequoia-vanilla:latest nix-darwin
	tart set nix-darwin --disk-size 100
	@just dev::up
	@just dev::wait_until_ready
	{{dev_run}} 'echo y | diskutil repairDisk $({{get_disk}})'
	{{dev_run}} 'diskutil apfs resizeContainer $({{get_disk_part}}) 0'

debug:
	{{dev_run}} 'echo $(pwd)'
	
up:
	tart run nix-darwin --dir nix-darwin:$(pwd)/.. > /tmp/tart.log 2>&1 &

stop:
	-tart stop nix-darwin

rm: stop
	-tart delete nix-darwin

ssh:
	-{{dev_run}}

[private]
wait_until_ready:
	#!/usr/bin/env bash
	until {{dev_run}} 'exit 0' 2>/dev/null
	do
		echo 'vm not ready...'
		sleep 5
	done
