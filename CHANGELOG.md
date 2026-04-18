# Changelog

## [Unreleased]

### Added
- Intel Mac (x86_64) support: `build-legion.yml` and `build-ruby.yml` now build `darwin-x86_64` tarballs alongside `darwin-arm64` on `macos-13` runners
- `build-bottles.yml` adds `ventura` (Intel) to the bottle matrix alongside `arm64_sonoma` and `arm64_sequoia`
- `update-formula` automation now writes `on_arm`/`on_intel` blocks with correct SHA256s for both architectures after each build, replacing the previous arm64-only flat `url`/`sha256` fields

### Fixed
- TLS cert sync no longer writes freshness marker when zero certificates are imported
- Split single `.legion-synced` marker into per-source markers (keychain, rubygems, github, legionio) with independent 30-day TTL
- Import login keychain (`~/Library/Keychains/login.keychain-db`) where JAMF/corporate provisioning drops internal CAs

### Removed
- Dropped optional brew dependencies on vault, rabbitmq, postgresql@17, and ollama (all accessed via Ruby gems over TCP, not CLI binaries)

### Added
- Live certificate chain fetch for rubygems.org, github.com, and legionio.dev via `openssl s_client`
- `c_rehash` only runs when certificates actually changed
