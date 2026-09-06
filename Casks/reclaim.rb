cask "reclaim" do
  version "1.0.0"
  sha256 "ec56b0fc16165832cc925963eeeb636629f7ab8cb579350a9e1e76d70e807a3f"

  url "https://github.com/mesquitadev/reclaim/releases/download/v#{version}/Reclaim.zip"
  name "Reclaim"
  desc "Finds and removes build artifacts, dependency folders and tool caches"
  homepage "https://github.com/mesquitadev/reclaim"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sonoma"

  app "Reclaim.app"

  # O app é assinado ad-hoc, não notarizado pela Apple, então o Gatekeeper
  # recusa a primeira abertura. O Homebrew 6 removeu a opção --no-quarantine,
  # de modo que só restam limpar o atributo à mão ou abrir uma vez pelo menu
  # de contexto.
  caveats do
    <<~EOS
      Reclaim is signed ad-hoc rather than notarized by Apple, so macOS will
      refuse the first launch. Clear the quarantine flag once:

        xattr -dr com.apple.quarantine "#{appdir}/Reclaim.app"

      Or right-click Reclaim.app in Finder, choose Open, then Open again.

      To scan ~/Documents, ~/Desktop or ~/Library/Developer, grant Full Disk
      Access in System Settings > Privacy & Security.
    EOS
  end

  zap trash: [
    "~/Library/Preferences/dev.mesquita.Reclaim.plist",
    "~/Library/Saved Application State/dev.mesquita.Reclaim.savedState",
  ]
end
