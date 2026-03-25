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
│   ├── legionio-ruby.rb       # Ruby 3.4.8 runtime with YJIT and vendored native gems
│   ├── legionio.rb            # LegionIO daemon + operational CLI (legionio start, lex, tasks, mcp)
│   ├── legion-tty.rb          # Interactive terminal shell + AI chat (legion command)
│   ├── legion-dev.rb          # Meta-formula: full development stack
│   └── legion.rb              # DEPRECATED (2026-03-20): legacy monolithic formula
├── .github/
│   └── workflows/
│       ├── test.yml           # Brew test-bot CI (install + test + audit on macOS)
│       └── build-ruby.yml     # Builds prebuilt Ruby tarball and uploads to GitHub Releases
└── README.md
```

## Formulas

### `Formula/legionio-ruby.rb` — Ruby Runtime

Installs a self-contained Ruby 3.4.8 with YJIT and pre-compiled native gems:

- **Source**: Prebuilt tarball from GitHub Releases (`https://github.com/LegionIO/homebrew-tap/releases/download/ruby-{VERSION}-{REVISION}/legion-ruby-{VERSION}-{REVISION}-darwin-arm64.tar.gz`)
- **Dependencies**: `openssl@3`, `snappy` — no separate Ruby installation needed
- **Install method**: Unpacks to `libexec`, rewrites Ruby shebangs to installed paths
- **Pre-installed native gems**: `sqlite3`, `pg` (vendored libpq), `mysql2` (vendored libmysqlclient), `oj`, `bundler`
- **Test**: checks `ruby -v`, YJIT enablement, `sqlite3` and `oj` require

### `Formula/legionio.rb` — Daemon Formula

Installs the `legionio` gem as a standalone Homebrew package using a gems-only tarball:

- **Source**: Gems tarball from GitHub Releases (no Ruby compilation needed — uses `legionio-ruby`)
- **Dependencies**: `legionio-ruby` (required), `redis` (required); `ollama`, `postgresql@17`, `rabbitmq`, `vault` (optional)
- **Install method**: Installs gems to `libexec/gems`, creates `legionio` wrapper script with correct `GEM_PATH` pointing to both gem dir and `legionio-ruby` gem dir
- **Service**: `brew services start legionio` runs `legionio start --log-level info` via launchd/systemd
  - Logs: `$(brew --prefix)/var/log/legion/legion.log`
  - Data: `$(brew --prefix)/var/lib/legion/`
- **Test**: `legionio version` must output the expected version string

### `Formula/legion-tty.rb` — Terminal Shell Formula

Installs the `legion-tty` gem with all tty-ruby dependencies:

- **Source**: Gems tarball from GitHub Releases
- **Dependencies**: `legionio` (and transitively `legionio-ruby`)
- **Install method**: Installs gems to `libexec/gems`, creates `legion` wrapper with `GEM_PATH` layered over daemon gems and ruby gems
- **post_install**: Fetches and rehashes TLS certificates (rubygems.org, github.com) into `openssl@3` cert dir
- **Example configs**: Written to `share/legionio/examples/` during install; users run `legionio config scaffold` to copy to `~/.legionio/settings/`
- **Test**: `legion version` must output the expected version string

### `Formula/legion-dev.rb` — Development Meta-Formula

A meta-formula that installs the full development stack:

- **Dependencies**: `legion-tty`, `ollama`, `postgresql@17`, `rabbitmq`, `rbenv` (recommended), `redis`, `vault`
- **No binary**: delegates `legion` to `legion-tty` and `legionio` to the `legionio` formula
- **Install**: writes a README to prefix only (no gem install)
- **Test**: runs `legion version`

### `Formula/legion.rb` — DEPRECATED

The legacy monolithic formula (deprecated 2026-03-20). Replaced by the `legionio-ruby` + `legionio` + `legion-tty` split. Existing users should migrate:

```bash
brew uninstall legion
brew install legionio legion-tty
```

## Build Workflow (`build-ruby.yml`)

A `workflow_dispatch` workflow that compiles a prebuilt Ruby tarball and uploads it to GitHub Releases.

**Inputs:**
- `ruby_version` (default: `3.4.8`)
- `package_revision` (default: `2`) -- increment when gems change without a Ruby version bump

**Runner:** `macos-14` (ARM64)

**Matrix:** single entry (`darwin-arm64`), expandable for additional platforms

**What it does:**
1. Compiles Ruby with YJIT and load-relative enabled
2. Installs all required gems: `legionio` + deps, `legion-data` + `sqlite3`, `legion-llm` + `ruby_llm`, `lex-llm-gateway`, `lex-detect`, `pg`, `mysql2`, `bundler`
3. Vendors native shared libraries: `libpq`, `libmysqlclient`, `libssl`, `libcrypto`, `libyaml`
4. Rewrites dylib paths (via `install_name_tool`) so the tarball is self-contained and relocatable
5. Verifies the result by running `legion version` inside the build environment
6. Uploads tarball to GitHub Releases

**Release tag format:** `ruby-{VERSION}-{REVISION}` (e.g., `ruby-3.4.8-2`)

**Tarball name:** `legion-ruby-{VERSION}-{REVISION}-{SUFFIX}.tar.gz` (e.g., `legion-ruby-3.4.8-2-darwin-arm64.tar.gz`)

**Versioning scheme:** `{ruby_version}-{package_revision}` (e.g., `3.4.8-2`)
- Bump `package_revision` when gems change (new gems, updated gems) on the same Ruby
- Bump `ruby_version` when upgrading the bundled Ruby interpreter
- Old releases are preserved (no delete-and-replace)
- The `update-formula` job auto-commits the new URL, SHA256, and version to `Formula/legion.rb`

### Updating the Formulas

There are two update paths depending on what changed:

#### 1. Gem update (common) -- bump package revision

When Legion gems change (new features, new gems like legion-tty):

1. Trigger `build-ruby.yml` via `workflow_dispatch`
2. Set `ruby_version` to current (e.g., `3.4.8`)
3. Increment `package_revision` (e.g., `1` -> `2`)
4. The workflow builds the tarball, creates a release, and auto-updates `Formula/legion.rb`

No manual formula editing needed -- the `update-formula` job handles URL, SHA256, and version.

#### 2. Ruby version bump (rare)

When the bundled Ruby version needs to change:

1. Trigger `build-ruby.yml` with the new `ruby_version` and `package_revision: 1`
2. The workflow handles everything automatically

Example formula reference:
```ruby
url "https://github.com/LegionIO/homebrew-tap/releases/download/ruby-3.4.8-13/legion-ruby-3.4.8-13-darwin-arm64.tar.gz"
sha256 "3839ccedf2c31f3434f2bb4984e92664c9e6c17ef0517efda2cca2c0e0f311e3"
version "3.4.8-13"
```

### Gem Isolation

The formulas implement 3-layer isolation to prevent system/rbenv gems from leaking into the Homebrew installation:

1. **`legionio-ruby`**: Installs `rubygems/defaults/operating_system.rb` that overrides `Gem.user_dir`, `Gem.default_dir`, and `Gem.default_path` to stay inside the Cellar. Prevents `~/.gem/ruby/3.4.0` from appearing in gem resolution.
2. **`legionio` / `legion-tty`**: Write wrapper scripts directly (not via `write_env_script` which drops empty strings). Set `RUBYGEMS_GEMDEPS=""`, `BUNDLE_GEMFILE=""`, `RUBYOPT=""` to disable Gemfile scanning and rbenv injections.
3. **Explicit `GEM_PATH`/`GEM_HOME`**: Wrapper scripts only list Cellar gem directories.

**Important**: `RbConfig::CONFIG["ruby_version"]` during `brew install` returns Homebrew's own Ruby version (e.g., 4.0.0), NOT the version being installed. The formula derives the correct version from the gem directory path.

### Current Version

- **Bundled Ruby**: 3.4.8 (compiled with YJIT, self-contained with vendored native libs)
- **Current package version**: `3.4.8-15` (Ruby 3.4.8, package revision 15)
- **legionio gem version**: 1.4.114 (separate gems tarball)
- **legion-tty gem version**: 0.4.29 (separate gems tarball)

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
