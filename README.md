# mesquitadev/homebrew-tap

Homebrew tap for native macOS tools.

**[Reclaim](https://github.com/mesquitadev/reclaim)** — finds and removes build
artifacts, dependency folders and tool caches across a dozen languages.

```sh
brew install --cask mesquitadev/tap/reclaim
xattr -dr com.apple.quarantine /Applications/Reclaim.app
```

**[Bootsmith](https://github.com/mesquitadev/bootsmith)** — writes bootable Linux
images to USB drives, for both legacy BIOS and UEFI machines.

```sh
brew install --cask mesquitadev/tap/bootsmith
xattr -dr com.apple.quarantine /Applications/Bootsmith.app
```

**[Roster](https://github.com/mesquitadev/roster)** — scans a network and
identifies the devices on it by NetBIOS, Bonjour, MAC vendor and service banners.

```sh
brew install --cask mesquitadev/tap/roster
xattr -dr com.apple.quarantine /Applications/Roster.app
```

The second line is needed because the app is signed ad-hoc rather than notarized
by Apple: without it macOS refuses the first launch. (Homebrew 6 removed the
`--no-quarantine` flag that used to handle this.) Right-clicking the app in
Finder → Open → Open does the same thing once.
