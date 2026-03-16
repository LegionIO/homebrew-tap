# LegionIO Homebrew Tap

Homebrew formulae for [LegionIO](https://github.com/LegionIO/LegionIO), an extensible async job engine and agentic AI framework for Ruby.

## Installation

```bash
brew tap legionio/tap
brew install legion
```

For local development with all services:

```bash
brew install legion-dev
```

## Available Formulae

| Formula | Description | Dependencies |
|---------|-------------|--------------|
| `legion` | LegionIO CLI + background service | `ruby`, `redis` (required); `ollama`, `postgresql@17`, `rabbitmq`, `vault` (optional) |
| `legion-dev` | Full development stack (meta-package) | Everything in `legion` plus `ollama`, `postgresql@17`, `rabbitmq`, `rbenv`, `vault` |

## Services

Legion registers a Homebrew-managed background service. Start it with:

```bash
brew services start legion
```

This runs `legion start` under launchd (macOS) or systemd (Linux) with automatic restart on failure.

### Service Paths

| Path | Purpose |
|------|---------|
| `$(brew --prefix)/var/log/legion/legion.log` | Combined stdout + stderr log |
| `$(brew --prefix)/var/lib/legion/` | Working directory / state |

### Managing the Service

```bash
brew services start legion       # start in background
brew services stop legion        # stop
brew services restart legion     # restart
brew services info legion        # show status, PID, log paths
```

### Dependency Services

Legion optionally integrates with several services. Start the ones you need:

```bash
brew services start redis             # required for tracing and dream cycle
brew services start rabbitmq          # job engine messaging (AMQP)
brew services start postgresql@17     # legion-data persistence
brew services start vault             # legion-crypt secrets management
ollama serve                          # local LLM for legion chat
```

The `legion-dev` formula installs all of these as hard dependencies.

## CLI Usage

After installing, the `legion` CLI is available:

```bash
legion version                   # show version and installed extensions
legion status                    # check service status
legion check                     # smoke-test subsystems
legion doctor                    # diagnose environment issues

legion start                     # start in foreground (use brew services for background)
legion start -d                  # daemonize manually (prefer brew services instead)

legion lex list                  # list installed extensions
legion lex info <name>           # extension details
legion lex create <name>         # scaffold a new extension

legion task list                 # list tasks
legion task run <ext.runner.func> key:val ...

legion mcp                       # start MCP server (AI agent integration)
legion chat                      # interactive AI REPL
legion config scaffold           # generate starter config files
```

Run `legion help` or `legion help <command>` for full CLI documentation.

## Updating

```bash
brew update
brew upgrade legion
brew services restart legion     # pick up the new version
```

## Troubleshooting

```bash
legion doctor                    # diagnose Ruby, config, services, permissions
brew services info legion        # check service status and log path
brew doctor                      # general Homebrew health check
brew reinstall legion            # reinstall from scratch
```

Report issues at https://github.com/LegionIO/homebrew-tap/issues

## Related

- Main framework: https://github.com/LegionIO/LegionIO
- GitHub org: https://github.com/LegionIO
- Install via RubyGems instead: `gem install legionio`
