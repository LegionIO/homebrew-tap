# LegionIO Homebrew Tap

Homebrew formulae for [LegionIO](https://github.com/LegionIO/LegionIO) tools.

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

| Formula | Version | Description |
|---------|---------|-------------|
| `legion` | 1.4.8 | LegionIO CLI with Ruby and Redis |
| `legion-dev` | 1.4.8 | Full development stack (RabbitMQ, PostgreSQL, Vault, Ollama, rbenv) |

## Usage

After installing, the `legion` CLI is available:

```bash
# Start the daemon
legion start

# Check service status
legion status

# List installed extensions
legion lex list

# Run a task
legion task run http.request.get url:https://example.com

# Start the MCP server (for AI agent integration)
legion mcp
```

## Requirements

- macOS with Homebrew
- Ruby and Redis (installed automatically with `legion`)
- RabbitMQ (optional — `brew install legion-dev` for full stack)

## Updating

```bash
brew update
brew upgrade legion
```

## Troubleshooting

```bash
brew doctor
brew reinstall legion
```

Report issues at https://github.com/LegionIO/homebrew-tap/issues

## Related

- Main framework: https://github.com/LegionIO/LegionIO
- GitHub org: https://github.com/LegionIO
- Install via RubyGems instead: `gem install legionio`
