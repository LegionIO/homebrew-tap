# homebrew-tap — LegionIO Homebrew Tap

**Level 3 Documentation**
- **Parent**: `/Users/miverso2/rubymine/legion/CLAUDE.md`
- **GitHub**: https://github.com/LegionIO/homebrew-tap

## Purpose

Homebrew tap providing formula installation of the `legion` CLI tool on macOS. Users run `brew tap legionio/tap && brew install legion` to get the `legion` binary without managing Ruby gems directly.

## Repository Layout

```
homebrew-tap/
├── Formula/
│   ├── legion.rb              # Main formula: legionio gem + Ruby + Redis
│   └── legion-dev.rb          # Meta-formula: full development stack
├── .github/
│   └── workflows/
│       └── test.yml           # Brew test-bot CI (install + test + audit on macOS)
└── README.md
```

## Formulas

### `Formula/legion.rb` — Main Formula

Installs the `legionio` gem as a standalone Homebrew package:

- **Source**: RubyGems (`https://rubygems.org/downloads/legionio-{VERSION}.gem`)
- **Dependencies**: `ruby` (Homebrew's Ruby, not system Ruby), `redis` (required for tracing and dream cycle)
- **Optional dependencies**: `ollama`, `postgresql@17`, `rabbitmq`, `vault`
- **Install method**: `gem install` into `libexec` with isolated `GEM_HOME`/`GEM_PATH`, then wraps all binaries with env scripts
- **Service**: `brew services start legion` runs `legion start --log-level info` via launchd (macOS) or systemd (Linux)
  - Logs: `$(brew --prefix)/var/log/legion/legion.log`
  - Data: `$(brew --prefix)/var/lib/legion/`
  - PID: managed by launchd/systemd (not Legion's own `--pidfile`)
  - Uses `opt_bin` for upgrade-safe binary path
- **Test**: `legion version` must output the expected version string

### `Formula/legion-dev.rb` — Development Meta-Formula

A meta-formula that depends on `legionio/tap/legion` and installs the full development stack:

- **Additional dependencies**: `ollama`, `postgresql@17`, `rabbitmq`, `rbenv`, `redis`, `vault`
- **No binary**: delegates the `legion` CLI to the `legion` formula
- **Install**: writes a README to prefix only (no gem install)
- **Test**: runs `legion version`

### Updating the Formulas

When a new `legionio` gem version is released to RubyGems, update **both** `legion.rb` and `legion-dev.rb`:

1. Get the new gem's SHA256: `curl -sL https://rubygems.org/downloads/legionio-{VERSION}.gem | sha256sum`
2. Update `url` with the new version number in both files
3. Update `sha256` with the new checksum in both files
4. Open a PR — the `test.yml` CI will install and test the formula on macOS

Example update:
```ruby
url "https://rubygems.org/downloads/legionio-1.4.9.gem"
sha256 "abc123..."
```

The formula version is derived from the URL — no separate `version` field needed.

### Current Version

`legionio` 1.4.8 — matches `Legion::VERSION` in `/Users/miverso2/rubymine/legion/LegionIO/lib/legion/version.rb`

## CI (`test.yml`)

Runs `brew-test-bot` on `macos-latest` on every push and PR:
1. Set up Homebrew
2. Copy this repo into the Homebrew taps directory as `legionio/homebrew-tap`
3. `brew install legionio/tap/legion`
4. `brew test legionio/tap/legion` (runs `legion version`)
5. `brew audit --strict legionio/tap/legion || true` (audit failures are non-blocking)

Note: CI only tests `legion`, not `legion-dev`. The `legion-dev` meta-formula is not included in the automated test run because it would pull in Ollama, RabbitMQ, Vault, and PostgreSQL, which significantly increases CI time.

## Homebrew Tap Conventions

- Repo must be named `homebrew-{tap-name}` — hence `homebrew-tap` for `legionio/tap`
- Formula file lives in `Formula/` and is named after the formula (`legion.rb`)
- Formula class name matches the formula name in CamelCase (`Legion`)
- Tapping: `brew tap legionio/tap` points to `github.com/LegionIO/homebrew-tap`

## Related

- Framework source: `/Users/miverso2/rubymine/legion/LegionIO/`
- RubyGems alternative: `gem install legionio`
- Org CI config: `/Users/miverso2/rubymine/legion/.github/`
