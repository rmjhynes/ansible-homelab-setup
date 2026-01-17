# Ansible Homelab Setup
The Ansible playbook and roles used to setup my [Homelab](https://github.com/rmjhynes/homelab) machine.

## Usage

See [SETUP.md](SETUP.md) for detailed prerequisites, setup instructions and troubleshooting guidance.

**Quick start:**
1. Setup an `inventory.ini` file in the root of this repo targeting your homelab host
2. Run `ansible-playbook -i inventory.ini playbooks/main.yaml`

## Roles
- `system-config` - Basic system configuration
- `vpn` - Starts [Mullvad VPN](https://mullvad.net/en) and logs in
- `git` - Configures `~/.gitconfig` file and generates an SSH key pair to authenticate to GitHub
- `dotfiles` - Clones my [dotfiles](https://github.com/rmjhynes/dotfiles) repo and runs the setup
- `k3s` - Installs and sets up [k3s](https://k3s.io/)

## Ansible Lint (via pre-commit)
[Ansible Lint](https://docs.ansible.com/projects/lint/) is run via a [pre-commit hook](https://docs.ansible.com/projects/lint/configuring/#pre-commit-setup). The configuration for this is found in the [`.ansible-lint.yaml`](.ansible-lint.yaml) file.

It provides immediate feedback to ensure that all Ansible code is structured correctly and adheres to best practices.
