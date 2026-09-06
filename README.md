# mesquitadev/homebrew-tap

Homebrew tap for [Reclaim](https://github.com/mesquitadev/reclaim) — a native
macOS app that finds and removes build artifacts, dependency folders and tool
caches across a dozen languages.

```sh
brew install --cask mesquitadev/tap/reclaim
xattr -dr com.apple.quarantine /Applications/Reclaim.app
```

The second line is needed because the app is signed ad-hoc rather than notarized
by Apple: without it macOS refuses the first launch. (Homebrew 6 removed the
`--no-quarantine` flag that used to handle this.) Right-clicking the app in
Finder → Open → Open does the same thing once.
