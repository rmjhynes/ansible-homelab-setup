# Ansible Homelab Setup
The Ansible playbook and roles used to setup my [Homelab](https://github.com/rmjhynes/homelab) machine.

## Usage
1. Setup an `inventory.ini` file in the root of this repo targeting your homelab host
2. Run `ansible-playbook -i inventory.ini playbooks/main.yaml`

## Roles
- `system-config` - Basic system configuration
- `nix` - Installs the [Nix package manager](https://nixos.org/download/#nix-install-linux)
- `vpn` - Starts [Mullvad VPN](https://mullvad.net/en) and logs in
- `git` - Configures `~/.gitconfig` file, generates an SSH key pair to authenticate to GitHub and a GPG key for commit signing
- `dotfiles` - Clones my [dotfiles](https://github.com/rmjhynes/dotfiles) repo, runs the setup script and installs [DevPod CLI](https://devpod.sh/docs/getting-started/install#install-devpod-cli)
- `k3s` - Installs and sets up [k3s](https://k3s.io/)

## Ansible Lint (via pre-commit)
[Ansible Lint](https://docs.ansible.com/projects/lint/) is run via a [pre-commit hook](https://docs.ansible.com/projects/lint/configuring/#pre-commit-setup). The configuration for this is found in the [`.ansible-lint.yaml`](.ansible-lint.yaml) file.

It provides immediate feedback to ensure that all Ansible code is structured correctly and adheres to best practices.
