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
│   ├── legion.rb              # Main formula: prebuilt Ruby tarball + Redis
│   └── legion-dev.rb          # Meta-formula: full development stack
├── .github/
│   └── workflows/
│       ├── test.yml           # Brew test-bot CI (install + test + audit on macOS)
│       └── build-ruby.yml     # Builds prebuilt Ruby tarball and uploads to GitHub Releases
└── README.md
```

## Formulas

### `Formula/legion.rb` — Main Formula

Installs the `legionio` gem as a standalone Homebrew package using a prebuilt Ruby tarball:

- **Source**: Prebuilt tarball from GitHub Releases (`https://github.com/LegionIO/homebrew-tap/releases/download/ruby-{VERSION}/legion-ruby-{VERSION}-darwin-arm64.tar.gz`)
- **Dependencies**: `redis` (required for tracing and dream cycle); NO `ruby` dependency — Ruby is bundled in the tarball
- **Optional dependencies**: `ollama`, `postgresql@17`, `rabbitmq`, `vault`
- **Install method**: Unpacks tarball to `libexec`, rewrites Ruby shebangs from build-machine paths to installed paths, then creates wrapper scripts that set `PATH`, `RUBYLIB`, `GEM_HOME`, `GEM_PATH`, and `DYLD_FALLBACK_LIBRARY_PATH` to the bundled paths
- **No post_install**: example configs are written to `share/legionio/examples/` during install; users run `legion config scaffold` to copy them to `~/.legionio/settings/`
- **Pre-installed gems in tarball**: `legionio` + all dependencies, `legion-data` + `sqlite3`, `legion-llm` + `ruby_llm`, `legion-tty` + tty-ruby gems, `lex-llm-gateway` (metering + fleet dispatch), `pg` (vendored libpq), `mysql2` (vendored libmysqlclient), `bundler`
- **Service**: `brew services start legion` runs `legion start --log-level info` via launchd (macOS) or systemd (Linux)
  - Logs: `$(brew --prefix)/var/log/legion/legion.log`
  - Data: `$(brew --prefix)/var/lib/legion/`
  - PID: managed by launchd/systemd (not Legion's own `--pidfile`)
  - Uses `opt_bin` for upgrade-safe binary path
- **Test**: `legion version` must output the expected version string

### `Formula/legion-dev.rb` — Development Meta-Formula

A meta-formula that depends on `legionio/tap/legion` and installs the full development stack:

- **Additional dependencies**: `ollama`, `postgresql@17`, `rabbitmq`, `rbenv` (recommended for managing Ruby versions, not required), `redis`, `vault`
- **Bundled Ruby**: comes from the `legion` formula's prebuilt tarball — `legion-dev` does not install a separate Ruby
- **No binary**: delegates the `legion` CLI to the `legion` formula
- **Install**: writes a README to prefix only (no gem install)
- **Test**: runs `legion version`

## Build Workflow (`build-ruby.yml`)

A `workflow_dispatch` workflow that compiles a prebuilt Ruby tarball and uploads it to GitHub Releases.

**Inputs:**
- `ruby_version` (default: `3.4.8`)
- `package_revision` (default: `2`) -- increment when gems change without a Ruby version bump

**Runner:** `macos-14` (ARM64)

**Matrix:** single entry (`darwin-arm64`), expandable for additional platforms

**What it does:**
1. Compiles Ruby with YJIT and load-relative enabled
2. Installs all required gems: `legionio` + deps, `legion-data` + `sqlite3`, `legion-llm` + `ruby_llm`, `lex-llm-gateway`, `pg`, `mysql2`, `bundler`
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
url "https://github.com/LegionIO/homebrew-tap/releases/download/ruby-3.4.8-2/legion-ruby-3.4.8-2-darwin-arm64.tar.gz"
sha256 "abc123..."
version "3.4.8-2"
```

### Current Version

- **Bundled Ruby**: 3.4.8 (compiled with YJIT, self-contained with vendored native libs)
- **Current package version**: `3.4.8-1` (Ruby 3.4.8, package revision 1)
- **Legion gem version**: tracked via gems pre-installed in the tarball

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
