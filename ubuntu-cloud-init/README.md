# cloud-init

## vm setup

```yml
general:
  start at boot: yes
os:
  iso image: ubuntu 22.04
system:
  bios: ovmf (uefi)
disks:
  scsi0:
    size: 8gb
cpu:
  cores: 1
  sockets: 1
memory:
  memory: 1gb
  min memory: 1gb
```

add cloud-init drive

## installations

untick create lvm

install openssh server
