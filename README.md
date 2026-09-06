# mesquitadev/homebrew-tap

Homebrew tap for [Reclaim](https://github.com/mesquitadev/reclaim) — a native
macOS app that finds and removes build artifacts, dependency folders and tool
caches across a dozen languages.

```sh
brew install --cask --no-quarantine mesquitadev/tap/reclaim
```

`--no-quarantine` is needed because the app is signed ad-hoc rather than
notarized by Apple. Without it, macOS refuses the first launch and you have to
right-click the app → Open → Open once.
