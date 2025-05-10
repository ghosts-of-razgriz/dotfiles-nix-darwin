export TERM := 'xterm-256color'

dev_sshpass := 'sshpass -p admin'

dev_run := dev_sshpass + " " + ssh_run + " -l admin $(tart ip nix-darwin)"

get_disk_part := 'diskutil list | grep "Apple_APFS Container" | awk "{print \$NF}"'

get_disk := get_disk_part + ' | sed "s/s[0-9]*\$//"'

ssh_run := 'ssh -t -o StrictHostKeyChecking=no'

install_nix := '''
if [ ! -d /nix ]; then \
	sh <(curl -L https://releases.nixos.org/nix/nix-2.28.0/install) --daemon --yes; \
else \
	echo "[INFO]: nix already installed"; \
fi
'''

install_homebrew := '''
if [ ! -d /opt/homebrew ]; then \
	bash <(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh); \
else \
	echo "[INFO]: homebrew already installed"; \
fi
'''

enable_filevault := '''
if [ "$(fdesetup status)" = "FileVault is On." ]; then \
   echo "[INFO]: FileVault already enabled"; \
else \
   sudo fdesetup enable -user $(whoami); \
fi
'''

clone_dotfiles_nix := '''
if [ -e ~/code/dotfiles/nix-darwin ] || [ -L ~/code/dotfiles/nix-darwin ]; then \
	echo "[INFO]: nix dotfiles already exist"; \
else \
	git clone git@github.com:ghosts-of-razgriz/dotfiles-nix-darwin.git ~/code/dotfiles/nix-darwin; \
fi
'''

run_on host cmd='':
	@if [ "{{host}}" = "yellow4" ]; then \
		{{dev_run}} '{{cmd}}'; \
	fi
