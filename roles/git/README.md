To push the Homelab machine’s SSH key to GitHub, the control machine requires a PAT (Personal Access Token) with the `admin:public_key` permission. This token should be set as an environment variable with `export ANSIBLE_GITHUB_PAT_TOKEN=<pat-token>`. If this environment variable is not set, Ansible will print the public key to the console so that it can be manually added to GitHub.

I followed and adpated the steps [here](https://docs.github.com/en/authentication/managing-commit-signature-verification/generating-a-new-gpg-key) for creating a GPG key.
