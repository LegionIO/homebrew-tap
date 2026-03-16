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
- **Install method**: Unpacks tarball to `libexec`, then creates wrapper scripts for all binaries that set `GEM_HOME`, `GEM_PATH`, and `DYLD_FALLBACK_LIBRARY_PATH` to the bundled paths
- **post_install**: Runs `gem update legionio legion-data legion-llm` using the bundled Ruby to update Legion gems after install
- **Pre-installed gems in tarball**: `legionio` + all dependencies, `legion-data` + `sqlite3`, `legion-llm` + `ruby_llm`, `pg` (vendored libpq), `mysql2` (vendored libmysqlclient), `bundler`
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

**Runner:** `macos-14` (ARM64)

**Matrix:** single entry (`darwin-arm64`), expandable for additional platforms

**What it does:**
1. Compiles Ruby with YJIT enabled
2. Installs all required gems: `legionio` + deps, `legion-data` + `sqlite3`, `legion-llm` + `ruby_llm`, `pg`, `mysql2`, `bundler`
3. Vendors native shared libraries: `libpq`, `libmysqlclient`, `libssl`, `libcrypto`, `libyaml`
4. Rewrites dylib paths (via `install_name_tool`) so the tarball is self-contained and relocatable
5. Verifies the result by running `legion version` inside the build environment
6. Uploads tarball to GitHub Releases

**Release tag format:** `ruby-{VERSION}` (e.g., `ruby-3.4.8`)

**Tarball name:** `legion-ruby-{VERSION}-{SUFFIX}.tar.gz` (e.g., `legion-ruby-3.4.8-darwin-arm64.tar.gz`)

### Updating the Formulas

There are two update paths depending on what changed:

#### 1. Legion gem update (common)

When a new `legionio` gem version is released, `post_install` will pick it up automatically via `gem update` on the next `brew upgrade`. For a formula-level pin update:

1. Update the `post_install` version references if pinning to a specific version
2. Open a PR — the `test.yml` CI will install and test the formula on macOS

Alternatively, the formula URL and SHA256 can be updated directly if the tarball is rebuilt with the new gem pre-installed.

#### 2. Ruby version bump (rare)

When the bundled Ruby version needs to change:

1. Trigger `build-ruby.yml` via `workflow_dispatch` with the new `ruby_version` input
2. Once the release is uploaded, get the SHA256: `curl -sL {TARBALL_URL} | sha256sum`
3. Update `url` and `sha256` in `Formula/legion.rb` to point to the new release
4. Update `Formula/legion-dev.rb` if it references the Ruby version directly
5. Open a PR — CI will validate

Example formula reference:
```ruby
url "https://github.com/LegionIO/homebrew-tap/releases/download/ruby-3.4.8/legion-ruby-3.4.8-darwin-arm64.tar.gz"
sha256 "abc123..."
```

### Current Version

- **Bundled Ruby**: 3.4.8 (compiled with YJIT, self-contained with vendored native libs)
- **Legion gem version**: tracked via gems pre-installed in the tarball; updated in-place by `post_install`

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
