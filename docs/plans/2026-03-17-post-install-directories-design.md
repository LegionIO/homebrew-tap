# Design: Create User Directories on Homebrew Install

## Problem

After `brew install legion`, the directories `~/.legion/`, `~/.legionio/`, and `~/.legionio/settings/` do not exist. Multiple features depend on them:

- `~/.legionio/settings/` — config file search path (legion-settings loader)
- `~/.legionio/` — parent for settings, cache, DB
- `~/.legion/` — chat memory, session store, agent definitions, skill files

Users must currently run `legion config scaffold` to create `~/.legionio/settings/`, and `~/.legion/` is only created implicitly when chat features first write to it. This causes confusing errors for new users.

## Proposed Solution

Add a `post_install` block to `Formula/legion.rb` that creates the three directories using `mkdir_p`. Homebrew's `post_install` runs as the installing user (not root), so `Dir.home` resolves correctly.

```ruby
def post_install
  home = Dir.home
  (Pathname.new(home)/".legion").mkpath
  (Pathname.new(home)/".legionio").mkpath
  (Pathname.new(home)/".legionio/settings").mkpath
end
```

### Why `post_install` and not `install`

- `install` runs in the Homebrew sandbox with a temporary `$HOME` — `Dir.home` may not point to the real user home
- `post_install` runs outside the sandbox with the real user environment
- `mkpath` is idempotent (no error if directories already exist)

### Why NOT auto-scaffold config files

- If `legion config scaffold` fails (e.g., JSON serialization issue, gem load error), it would cause `brew install` to fail
- Config files should be an explicit user action so they understand what was generated
- The caveats already instruct users to run `legion config scaffold`

## Alternatives Considered

1. **Do it in `install` block** — rejected because of sandbox `$HOME` issue
2. **Auto-run `legion config scaffold` in `post_install`** — rejected because any failure would break `brew install`
3. **Shell script wrapper** — unnecessary complexity, `post_install` is the standard Homebrew pattern

## Constraints

- Must not fail if directories already exist
- Must not write any files (only directories)
- Must work on both Apple Silicon and Intel Macs
