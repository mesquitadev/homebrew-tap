cask "roster" do
  version "1.0.0"
  sha256 "668882f650cc494dc535ba61e0a68b46b532bda6b584299579692d7852ca080a"

  url "https://github.com/mesquitadev/roster/releases/download/v#{version}/Roster.zip"
  name "Roster"
  desc "Scans a network and identifies the devices on it"
  homepage "https://github.com/mesquitadev/roster"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sonoma"

  app "Roster.app"

  caveats do
    <<~EOS
      Roster is signed ad-hoc rather than notarized by Apple, so macOS will
      refuse the first launch. Clear the quarantine flag once:

        xattr -dr com.apple.quarantine "#{appdir}/Roster.app"

      Then allow Roster under System Settings > Privacy & Security >
      Local Network. Since macOS 15 the system filters local network traffic
      for apps without that permission, and a scan will quietly find almost
      nothing.
    EOS
  end

  zap trash: [
    "~/Library/Preferences/dev.mesquita.Roster.plist",
    "~/Library/Saved Application State/dev.mesquita.Roster.savedState",
  ]
end
