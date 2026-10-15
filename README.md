# Matheus Coêlho's Homebrew tap

## garmcli

Read-only Garmin history, resumable sync, offline queries and JSON exports.

```bash
brew install matheuscoelhomalta/tap/garmcli
garmcli --json doctor
```

The formula installs Python 3.14 and [gccli](https://github.com/bpauli/gccli) as dependencies. Authentication is managed by gccli:

```bash
gccli auth login your-email@example.com
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
