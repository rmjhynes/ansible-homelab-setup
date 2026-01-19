# Ansible Homelab Setup
The Ansible playbook and roles used to setup my [Homelab](https://github.com/rmjhynes/homelab) Fedora machine.

## Usage

See [SETUP.md](SETUP.md) for detailed prerequisites, setup instructions and troubleshooting guidance.

**Quick start:**
1. Setup an `inventory.ini` file in the root of this repo targeting your homelab host
2. Run `ansible-playbook playbooks/main.yaml`

## Roles
- `dnf` - Installs packages via the DNF package manager
- `external_packages` - Installs tools not available in DNF (Starship, ArgoCD CLI, K3d, Kubeseal, Claude Code, lazygit, Ghostty, Terraform)
- `system_config` - Basic system configuration
- `git` - Configures `~/.gitconfig` file and generates an SSH key pair to authenticate to GitHub
- `dotfiles` - Clones my [dotfiles](https://github.com/rmjhynes/dotfiles) repo and runs the setup
- `k3s` - Installs and sets up [k3s](https://k3s.io/)
- `k3d_podman` - Configures rootless podman as the container runtime for [k3d](https://k3d.io/)
- `flatpak` - Installs Flatpak applications from Flathub
- `vpn` - Starts [Mullvad VPN](https://mullvad.net/en) and logs in

## Ansible Lint (via pre-commit)
[Ansible Lint](https://docs.ansible.com/projects/lint/) is run via a [pre-commit hook](https://docs.ansible.com/projects/lint/configuring/#pre-commit-setup). The configuration for this is found in the [`.ansible-lint.yaml`](.ansible-lint.yaml) file.

It provides immediate feedback to ensure that all Ansible code is structured correctly and adheres to best practices.
