cask "bootsmith" do
  version "1.0.0"
  sha256 "26d506d455234a26dc1876b205264e1c77c01ee9b9e9ee30b606a4b8137bbd9d"

  url "https://github.com/mesquitadev/bootsmith/releases/download/v#{version}/Bootsmith.zip"
  name "Bootsmith"
  desc "Writes bootable Linux images to USB drives for BIOS and UEFI"
  homepage "https://github.com/mesquitadev/bootsmith"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sonoma"

  app "Bootsmith.app"

  caveats do
    <<~EOS
      Bootsmith is signed ad-hoc rather than notarized by Apple, so macOS will
      refuse the first launch. Clear the quarantine flag once:

        xattr -dr com.apple.quarantine "#{appdir}/Bootsmith.app"

      Or right-click Bootsmith.app in Finder, choose Open, then Open again.

      Writing to a USB device needs Full Disk Access: grant it to Bootsmith in
      System Settings > Privacy & Security, then reopen the app. Since macOS 13
      removable volumes are protected and even root cannot open /dev/rdiskN
      without it.
    EOS
  end

  zap trash: [
    "~/Library/Preferences/dev.mesquita.Bootsmith.plist",
    "~/Library/Saved Application State/dev.mesquita.Bootsmith.savedState",
  ]
end
