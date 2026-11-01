# Upgrading the Fedora machine system version

The machine is currently running Fedora 44.

## 1. Update dnf packages
```sh
sudo dnf5 upgrade --refresh
sudo dnf5 needs-restarting
# if needs restarting then run:
reboot
```

## 2. Take snapshot of the root filesystem


> [!TIP]
> Import [the diagram](./btrfs-snapshot.excalidraw) into excalidraw for a visual representation of this process.

```sh
# Mount the btrfs top level (subvolid=5) at /mnt
sudo mount -o subvolid=5 "$(findmnt -nvo SOURCE /)" /mnt

# Take a read-only snapshot of the "root" subvolume and save it at the top
# level, next to "root" rather than nested inside it
sudo btrfs subvolume snapshot -r /mnt/root /mnt/root-f$(rpm -E %fedora)-$(date +%F)

# List the subvolumes to confirm the snapshot was created
sudo btrfs subvolume list /mnt

# Unmount the top level (snapshots stay on disk but they just aren't
# visible until the top level is mounted again)
sudo umount /mnt
```
## 3. Upgrade Fedora system version

The recommended way to download and upgrade Fedora Workstation is in the GNOME UI [as per the docs](https://docs.fedoraproject.org/en-US/quick-docs/upgrading-fedora-new-release/#_upgrading_to_the_next_fedora_workstation_release).
