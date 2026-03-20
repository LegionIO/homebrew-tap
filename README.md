# LegionIO Homebrew Tap

Homebrew formulae for [LegionIO](https://github.com/LegionIO/LegionIO), an extensible async job engine and agentic AI framework for Ruby.

## Installation

```bash
brew tap legionio/tap
brew install legion-tty
```

This installs `legionio` (daemon) and `legionio-ruby` (bundled Ruby runtime) automatically.

For local development with all services:

```bash
brew install legion-dev
```

## Available Formulae

| Formula | Description | Size |
|---------|-------------|------|
| `legionio-ruby` | Bundled Ruby 3.4.8 with YJIT + native extensions (sqlite3, pg, mysql2, oj, puma, snappy) | ~50MB |
| `legionio` | LegionIO daemon, core libraries, and agentic extensions | ~10MB |
| `legion-tty` | Interactive terminal shell and AI chat (`legion` binary) | ~4MB |
| `legion-dev` | Full development stack (meta-package: all services) | -- |

### Dependency Chain

```
legionio-ruby  (Ruby + native extensions)
└── legionio   (daemon + core + agentic gems)
    └── legion-tty  (interactive shell)
```

### Why 3 formulas?

Gem updates happen several times per week. The Ruby runtime changes rarely. By splitting them, `brew upgrade legion-tty` downloads a ~4MB tarball instead of a ~54MB full Ruby bundle. Upgrades complete in seconds.

## CLI Usage

```bash
# Interactive shell (from legion-tty)
legion                           # rich terminal UI with onboarding
legion chat                      # AI REPL

# Operational daemon (from legionio)
legionio start                   # start the daemon
legionio config scaffold         # generate config files
legionio lex list                # list extensions
legionio --help                  # all commands
```

## Services

```bash
brew services start legionio         # start daemon in background
brew services start redis            # required for tracing
brew services start rabbitmq         # job engine messaging (optional)
brew services start postgresql@17    # persistence (optional)
brew services start vault            # secrets (optional)
ollama serve                         # local LLM (optional)
```

## Updating

```bash
brew update
brew upgrade legion-tty              # fast: ~4MB download
brew upgrade legionio                # medium: ~10MB download
brew services restart legionio       # pick up new version
```

## Migrating from `legion` formula

The old `legion` formula is deprecated. To migrate:

```bash
brew uninstall legion
brew install legion-tty
```

## Troubleshooting

```bash
legion doctor                    # diagnose config, services, permissions
brew services info legionio      # check service status
brew doctor                      # general Homebrew health check
```

Report issues at https://github.com/LegionIO/homebrew-tap/issues

## Related

- Main framework: https://github.com/LegionIO/LegionIO
- GitHub org: https://github.com/LegionIO
- Install via RubyGems instead: `gem install legionio`
