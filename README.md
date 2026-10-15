# Matheus Coêlho's Homebrew tap

## garmcli

Read-only Garmin history, resumable sync, offline queries and JSON exports.

```bash
brew install matheuscoelhomalta/tap/garmcli
garmcli --json doctor
```

The 2.0.0 formula installs Python 3.14 and the required Python libraries, including
`garminconnect==0.3.18`. No separate gccli installation is required:

```bash
garmcli auth login your-email@example.com
```

Sessions use macOS Keychain or Linux Secret Service. Linux live access requires
an available, unlocked Secret Service; offline history queries need no session.
Upgrades from 1.0.0 preserve SQLite history and account identities. Authenticate
with garmcli after upgrading; the old `--gccli` option is removed.

```bash
brew update
brew upgrade matheuscoelhomalta/tap/garmcli
```

The companion agent skill is installed under `$(brew --prefix garmcli)/share/garmcli/skills/garmcli`. From a persistent Homebrew installation, link it into Codex's skill directory if no existing skill installation is present:

```bash
mkdir -p "$HOME/.codex/skills"
ln -s "$(brew --prefix garmcli)/share/garmcli/skills/garmcli" "$HOME/.codex/skills/garmcli"
```

Inspect any existing skill installation before changing it. If you already installed garmcli using uv or pipx, choose which installation should be on your PATH.

[Source and documentation](https://github.com/matheuscoelhomalta/garmcli) · [Releases](https://github.com/matheuscoelhomalta/garmcli/releases)

## Validation

```bash
brew test matheuscoelhomalta/tap/garmcli
```

The formula test uses an empty temporary database and does not access a Garmin account.
