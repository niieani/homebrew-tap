# homebrew-tap

Homebrew tap for `bb` and `imagegen`.

## Install

```bash
brew tap niieani/tap
brew install --cask bb
brew install --cask imagegen
```

## Maintenance

- `Casks/bb.rb` is managed by GoReleaser from the `bb` source repository.
- `Casks/imagegen.rb` is managed by release automation from the `imagegen`
  source repository.
- Manual edits to generated cask files may be overwritten by the release pipeline.
