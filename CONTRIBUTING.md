# Contributing to LegionIO Homebrew Tap

## Updating a Formula for a New Gem Version

### 1. Compute the SHA256 checksum

```bash
# For a gems tarball already uploaded to GitHub Releases:
curl -sL https://github.com/LegionIO/homebrew-tap/releases/download/<TAG>/<TARBALL> | shasum -a 256

# For a local tarball:
shasum -a 256 path/to/tarball.tar.gz
```

### 2. Update the formula

Edit the relevant file in `Formula/`:

| Formula | File | What to update |
|---------|------|----------------|
| legionio-ruby | `Formula/legionio-ruby.rb` | `url`, `sha256`, `version` |
| legionio | `Formula/legionio.rb` | `url`, `sha256`, `version` |
| legion-tty | `Formula/legion-tty.rb` | `url`, `sha256`, `version` |

Example diff:
```ruby
# Before
url "https://github.com/LegionIO/homebrew-tap/releases/download/legionio-1.4.192-1/legionio-gems-1.4.192-1.tar.gz"
sha256 "old_hash_here"
version "1.4.192-1"

# After
url "https://github.com/LegionIO/homebrew-tap/releases/download/legionio-1.5.0-1/legionio-gems-1.5.0-1.tar.gz"
sha256 "new_hash_here"
version "1.5.0-1"
```

### 3. Test locally

```bash
# Install from source (skips bottles)
brew install --build-from-source Formula/legionio.rb

# Run the formula's test block
brew test legionio

# Run Homebrew's linter
brew audit --strict legionio
```

### 4. Verify the installation works

```bash
legionio version
legion version
```

### 5. PR checklist

Before submitting a pull request:

- [ ] `url` points to a valid GitHub Release tarball
- [ ] `sha256` matches the tarball (`shasum -a 256`)
- [ ] `version` string matches the release tag
- [ ] `brew install --build-from-source` succeeds
- [ ] `brew test` passes
- [ ] `brew audit --strict` passes (or failures are cosmetic only)
- [ ] Commit message references the version bump (e.g., `bump legionio to 1.5.0-1`)

## Build Workflows

### Ruby runtime (`build-ruby.yml`)

Triggered via `workflow_dispatch`. Compiles Ruby 3.4.x with YJIT and pre-installs native extension gems.

**Inputs:**
- `ruby_version` — Ruby version to compile (default: `3.4.9`)
- `package_revision` — increment when gems change on the same Ruby

The workflow automatically updates `Formula/legionio-ruby.rb` after a successful build.

### Gem tarballs (`build-daemon.yml`, `build-tty.yml`)

Build the gems-only tarballs for `legionio` and `legion-tty`. These workflows install gems into an isolated directory, package them, and upload to GitHub Releases.

## Versioning

Formula versions follow `{gem_version}-{revision}`:
- Bump `gem_version` when the underlying gem version changes
- Bump `revision` for formula-only changes (dependency updates, install fixes)

## Bottle Updates

Bottles are prebuilt binaries cached by Homebrew. After a formula change:

1. The `build-bottles.yml` workflow runs on push to `main`
2. It builds bottles for `arm64_sequoia` and `arm64_sonoma`
3. Bottles are uploaded to the same GitHub Release

You don't need to manually build bottles — CI handles it.
