# Changelog

## [Unreleased]

### Added
- TLS cert environment isolation: all wrappers (`legionio`, `legion`, `legion-python`, `legion-pip`) and launchd service now force `SSL_CERT_FILE`, `REQUESTS_CA_BUNDLE`, `CURL_CA_BUNDLE`, and `PIP_CERT` to brew's OpenSSL cert chain
- Python environment isolation: clear `PYTHONPATH` and unset `PYTHONHOME` in all wrappers to prevent user env pollution
- Default Python packages expanded: `ruff`, `pylint`, `mypy`, `httpx`, `beautifulsoup4`, `jinja2`

### Fixed
- `post_install` CWD crash during `brew upgrade`: old cellar deletion invalidates working directory, causing Thor `Errno::ENOENT` in `reinstall_packs`, `setup_python_venv`, and `background_gem_update` — all now pass `chdir: var/"lib/legion"`
- `legion-python` and `legion-pip` default venv path changed from `$HOME/.legionio/python` to `libexec/python` (matches actual Cellar install location)
- `pip install` failures caused by corporate `REQUESTS_CA_BUNDLE` pointing at non-existent `/tmp/system-ca-bundle.pem`

### Added
- Linux x86_64 support for the Legion formula build and bottle workflows
- Formula generation now writes explicit `on_macos` and `on_linux` platform blocks so Linuxbrew does not select Darwin Intel tarballs
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
