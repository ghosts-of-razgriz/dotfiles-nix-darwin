export TERM := 'xterm-256color'
dev_sshpass := 'sshpass -p admin'
dev_run := dev_sshpass + " " + ssh_run + " -l admin $(tart ip nix-darwin)"
get_disk_part := 'diskutil list | grep "Apple_APFS Container" | awk "{print \$NF}"'
get_disk := get_disk_part + ' | sed "s/s[0-9]*\$//"'
ssh_run := 'ssh -t -o StrictHostKeyChecking=no'
install_nix := '''
if [ ! -d /nix ]; then \
	sh <(curl -L https://releases.nixos.org/nix/nix-2.28.0/install) --daemon --yes; \
	touch /tmp/restart_required; \
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
	git clone https://github.com/ghosts-of-razgriz/dotfiles-nix-darwin.git ~/code/dotfiles/nix-darwin; \
fi
'''
switch_shell := '''
if [ "$SHELL" = "$(which -a fish | grep current-system)" ]; then \
	echo "[INFO]: default shell already set"; \
else \
	chsh -s $(which -a fish | grep current-system); \
fi
'''
check_run_dir := '''
if [ -f /tmp/restart_required ]; then \
	echo "[INFO] RESTART REQUIRED"; \
	rm /tmp/restart_required; \
	read; \
fi
'''
cd_dotfiles_nix := 'cd ~/code/dotfiles/nix-darwin;'
nix_shell_cmd := '/nix/var/nix/profiles/default/bin/nix-shell'
flake_bootstrap := '--run "nh darwin switch . --hostname"'
darwin_rebuild := 'darwin-rebuild switch --flake .'

run_on host cmd='':
    @if [ "{{ host }}" = "yellow4" ]; then \
    	{{ ssh_run }} yellow4.razgriz.wtf '{{ cmd }}'; \
    elif [ "{{ host }}" = "yellow13" ]; then \
    	{{ ssh_run }} yellow13.razgriz.wtf '{{ cmd }}'; \
    elif [ "{{ host }}" = "cipher" ]; then \
    	{{ ssh_run }} cipher.razgriz.wtf '{{ cmd }}'; \
    elif [ "{{ host }}" = "dev" ]; then \
    	{{ dev_run }} '{{ cmd }}'; \
    fi

install-fonts:
    if [ ! -d ~/code/font-operator-mono ]; then \
    	git clone git@github.com:ghosts-of-razgriz/font-operator-mono.git $HOME/code/font-operator-mono; \
    fi
    open ~/code/font-operator-mono/nerd-operator/*

dotfiles-nix:
    cd ~/code/dotfiles/nix-darwin; \
    git remote set-url origin git@github.com:ghosts-of-razgriz/dotfiles-nix-darwin.git

dotfiles-neovim:
    echo 'dotfiles-neovim: NOT YET IMPLEMENTED'
