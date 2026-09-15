cask "vigia" do
  version "1.2.0"
  sha256 "327d8b3991b7fae635d0c88b86f167c4000194182a8fcbdfc11e6749c8ba2946"

  url "https://github.com/mesquitadev/vigia/releases/download/v#{version}/Vigia.zip"
  name "Vigia"
  desc "Records IP cameras to your own server and plays them back natively"
  homepage "https://github.com/mesquitadev/vigia"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Vigia.app"

  caveats do
    <<~EOS
      Vigia is signed ad-hoc rather than notarized by Apple, so macOS will
      refuse the first launch. Clear the quarantine flag once:

        xattr -dr com.apple.quarantine "#{appdir}/Vigia.app"

      Vigia talks to a recorder on your local network. Allow it under
      System Settings > Privacy & Security > Local Network, or it will find
      nothing and report no error.
    EOS
  end
end
