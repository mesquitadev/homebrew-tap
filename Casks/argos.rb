cask "argos" do
  version "1.3.0"
  sha256 "ea9ae313268a28b625a0aa281f2f13c8f031a4c7de63b60732f20249424a8315"

  url "https://github.com/mesquitadev/argos/releases/download/v#{version}/Argos.zip"
  name "Argos"
  desc "Records IP cameras to your own server and plays them back natively"
  homepage "https://github.com/mesquitadev/argos"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Argos.app"

  caveats do
    <<~EOS
      Argos is signed ad-hoc rather than notarized by Apple, so macOS will
      refuse the first launch. Clear the quarantine flag once:

        xattr -dr com.apple.quarantine "#{appdir}/Argos.app"

      Argos talks to a recorder on your local network. Allow it under
      System Settings > Privacy & Security > Local Network, or it will find
      nothing and report no error.
    EOS
  end
end
