# linfo

A fast, dependency-light Linux information shell built with Bash and standard Linux interfaces.

`linfo` collects hardware, software, storage, networking, services, sensors and kernel information behind short, memorable commands.

## Quick install

```bash
git clone https://github.com/hydrargyrum13/linfo.git /tmp/linfo && bash /tmp/linfo/install.sh
```

Then open a new terminal and run:

```text
linfo
```

## Interactive shell

Running `linfo` without arguments opens the interactive shell:

```text
  _     ___ _   _ _____ ___
 | |   |_ _| \ | |  ___/ _ \
 | |    | ||  \| | |_ | | | |
 | |___ | || |\  |  _|| |_| |
 |_____|___|_| \_|_|   \___/

  Linux information, without the scavenger hunt.

linfo › cpu
linfo › gpu temp
linfo › disk health
linfo › network ip
linfo › help
```

Direct commands skip the banner:

```text
linfo cpu temp
linfo gpu load
linfo ram usage
linfo disk health
```

## Commands

| Command | Description |
| --- | --- |
| `linfo summary` | Compact system overview |
| `linfo health` | Quick system health overview |
| `linfo temps` | All sensor temperatures |
| `linfo cpu` | CPU details |
| `linfo cpu temp` | CPU temperature |
| `linfo cpu load` | Load averages |
| `linfo cpu clock` | Average current CPU clock |
| `linfo gpu` | GPU devices |
| `linfo gpu temp` | GPU temperature when exposed |
| `linfo gpu load` | GPU utilization when supported |
| `linfo gpu vram` | VRAM usage when supported |
| `linfo ram` | Memory overview |
| `linfo ram usage` | Memory usage |
| `linfo ram modules` | DIMM information when `dmidecode` is available |
| `linfo disk` | Storage devices and filesystems |
| `linfo disk usage` | Filesystem usage |
| `linfo disk health` | SMART health when `smartctl` is available |
| `linfo disk temp` | Disk/NVMe temperatures when exposed |
| `linfo os` | Distribution, kernel, architecture and uptime |
| `linfo kernel` | Kernel and boot arguments |
| `linfo display` | Display outputs |
| `linfo wifi` | Wi-Fi information |
| `linfo wifi signal` | Current Wi-Fi signal |
| `linfo usb` | USB devices |
| `linfo audio` | Audio server/devices |
| `linfo network` | Network overview |
| `linfo network ip` | Interface addresses |
| `linfo network dns` | DNS servers |
| `linfo network public` | Public IP |
| `linfo network ports` | Listening ports |
| `linfo processes [n]` | Top processes |
| `linfo services` | Running systemd services |
| `linfo startup` | Enabled systemd units |
| `linfo packages [query]` | Installed packages |
| `linfo uptime` | Uptime only |
| `linfo doctor` | Check which optional provider tools are installed |
| `linfo help` | Command reference |

Aliases include `memory`, `storage`, `system`, `monitor`, `net`, `ps`, `apps`, `temp`, `publicip`, and `ports`.

## Dependencies

The core tool only requires Bash and Linux `/proc`/`/sys` interfaces. It automatically uses common utilities when available:

- `ip` / `ss`
- `lsblk`
- `lspci`
- `lm-sensors`
- `smartmontools`
- `NetworkManager` (`nmcli`)
- `systemd`
- `pactl` / `wpctl`
- `nvidia-smi`

Missing optional tools do not prevent `linfo` from running. The relevant command reports that the provider is unavailable instead of inventing data.

## Install location

`install.sh` installs the executable to:

```text
~/.local/bin/linfo
```

It also adds `~/.local/bin` to Bash, Zsh, or Fish PATH configuration when necessary.

## License

MIT
