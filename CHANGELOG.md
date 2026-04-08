# Changelog

## [Unreleased]

### Fixed
- TLS cert sync no longer writes freshness marker when zero certificates are imported
- Split single `.legion-synced` marker into per-source markers (keychain, rubygems, github, legionio) with independent 30-day TTL

### Removed
- Dropped optional brew dependencies on vault, rabbitmq, postgresql@17, and ollama (all accessed via Ruby gems over TCP, not CLI binaries)

### Added
- `SSL_CERT_DIR` export in all wrapper scripts (legionio, legion, legion-ruby, legion-gem, legion-bundle, legion-irb)
- Live certificate chain fetch for rubygems.org, github.com, and legionio.dev via `openssl s_client`
- `c_rehash` only runs when certificates actually changed
