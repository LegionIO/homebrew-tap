# Implementation: Create User Directories on Homebrew Install

## Phase 1: Add `post_install` to Formula

### Files to Modify

- `Formula/legion.rb` — add `post_install` method

### Changes

Add after the `service` block (line ~63):

```ruby
def post_install
  home = Dir.home
  (Pathname.new(home)/".legion").mkpath
  (Pathname.new(home)/".legionio").mkpath
  (Pathname.new(home)/".legionio/settings").mkpath
end
```

### Spec Coverage

- `brew test legionio/tap/legion` already runs `legion version` — no new test needed
- The `post_install` uses only `Pathname#mkpath` which is idempotent and well-tested by Ruby stdlib

### Version Bump

No gem version bump needed — this is a formula-only change.

## Phase 2: Update Caveats (Optional)

Update the caveats text to mention the directories were created:

```ruby
def caveats
  <<~EOS
    Directories created:
      ~/.legion/          (chat memory, agents, skills)
      ~/.legionio/        (framework data)
      ~/.legionio/settings/  (config files)

    First run:
      legion config scaffold           # generate starter config files
    ...
  EOS
end
```
