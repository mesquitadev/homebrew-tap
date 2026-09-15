cask "ember" do
  version "1.0.0"
  sha256 "9f04e6ae83311d2e186dc34ce362a8fbb91be8a005c51bd400b1c32d85eb06ab"

  url "https://github.com/mesquitadev/ember/releases/download/v#{version}/Ember.zip"
  name "Ember"
  desc "Keeps the Mac awake from the menu bar"
  homepage "https://github.com/mesquitadev/ember"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sonoma"

  app "Ember.app"

  caveats do
    <<~EOS
      Ember is signed ad-hoc rather than notarized by Apple, so macOS will
      refuse the first launch. Clear the quarantine flag once:

        xattr -dr com.apple.quarantine "#{appdir}/Ember.app"

      Ember lives only in the menu bar: there is no Dock icon and no window.
    EOS
  end
end
