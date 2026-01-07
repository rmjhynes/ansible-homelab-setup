# Setup Guide

## Prerequisites

**On the control machine:**
- Ansible installed
- GitHub Personal Access Token (classic) with `admin:public_key` scope
- Mullvad account number

**On the target machine:**
- OpenSUSE Leap (tested on Leap 16)

## Target Machine Setup

### 1. Start SSH Service

On the target machine, enable and start SSH:

```bash
systemctl enable sshd
systemctl start sshd
systemctl status sshd

# Optional - check SSH is listening on port 22
ss -tlnp | grep :22
```

### 2. Configure Firewall

Check if firewall is running and allows SSH on port 22:

```bash
# Check if firewalld is running
systemctl status firewalld

# List allowed services
firewall-cmd --list-services

# List allowed ports
firewall-cmd --list-ports

# Check if SSH service is allowed
firewall-cmd --list-services | grep ssh
```

If SSH is blocked, allow it through the firewall:

```bash
# Allow SSH through firewall (permanent)
sudo firewall-cmd --permanent --add-service=ssh
sudo firewall-cmd --reload

# Verify it's now allowed
sudo firewall-cmd --list-services
```

### 3. Get Machine IP Address

On the target machine, get the IP address in order to connect from your control machine:

```bash
ip a
```

### 4. Setup SSH Key Authentication

Ensure an SSH key is generated on your control machine and copied to the target machine for passwordless authentication.

### 5. Test SSH Connection

From your control machine, verify you can SSH to the target:

```bash
ssh rmjhynes@<ip-address>
```

## Control Machine Setup

### 1. Update Inventory File

Update the `inventory.ini` file in the repository root to reference your target machine:

```ini
[myhosts]
homelab ansible_user=rmjhynes # physical homelab machine
```

### 2. Set Environment Variables

Export the required environment variables on your control machine:

```bash
export ANSIBLE_MULLVAD_ACCOUNT_NUMBER="<mullvad-account-number>"
export ANSIBLE_GITHUB_PAT_TOKEN="<github-pat-token>"
```

> [!NOTE]
> These environment variables are required by the VPN and Git roles respectively.

## Verification

### Test Ansible Connectivity

From your control machine, verify Ansible can connect to the target:

```bash
ansible homelab -m ping -i inventory.ini
```

Expected output:

```
homelab | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3.13"
    },
    "changed": false,
    "ping": "pong"
}
```

## Running the Playbook

Execute the full playbook with sudo password prompt:

```bash
ansible-playbook -i inventory.ini playbooks/main.yaml
```

## Troubleshooting

### Nix Installation Requires tar

If the Nix package manager installation fails because `tar` is not installed, install it using zypper (since Nix isn't available yet):

```bash
sudo zypper install tar
```

### SELinux Compatibility

OpenSUSE Leap 16 uses SELinux. Unfortunately, Nix package manager does not work with SELinux enabled so I have disabled it. To disable it:

```bash
sudo setenforce 0
sudo getenforce
# Should output: Permissive (disabled)

# Reboot to persist the change
reboot

# After reboot, verify it's still disabled
sudo getenforce
# Should output: Disabled
```
