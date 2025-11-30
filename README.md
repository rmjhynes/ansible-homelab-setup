# Ansible Homelab Setup
The Ansible playbook and roles used to setup my [Homelab](https://github.com/rmjhynes/homelab) machine.

## Usage
1. Setup an `inventory.ini` file in the root of this repo targeting your homelab host
2. Run `ansible-playbook -K -i inventory.ini playbooks/main.yaml`

## Roles
- `system-config` - Basic system configuration
- `nix` - Installs the [Nix package manager](https://nixos.org/download/#nix-install-linux)
- `vpn` - Starts [Mullvad VPN](https://mullvad.net/en) and logs in
- `git` - Configures `~/.gitconfig` file, generates an SSH key pair to authenticate to GitHub and a GPG key for commit signing
- `dotfiles` - Clones my [dotfiles](https://github.com/rmjhynes/dotfiles) repo, runs the setup script and installs [DevPod CLI](https://devpod.sh/docs/getting-started/install#install-devpod-cli)
