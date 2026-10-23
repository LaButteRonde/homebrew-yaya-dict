cask "yaya-dict" do
  version "0.22.1"
  sha256 "fc0e49cea0cae91c850c4b90eed137973bbf08a3e8030597817ae75f31748499"

  url "https://github.com/LaButteRonde/homebrew-murmur/releases/download/v#{version}/Yaya-dict-darwin-arm64-#{version}.zip"
  name "Yaya-dict"
  desc "Dictée vocale 100 % locale pour macOS — Whisper + correction LLM, sans cloud"
  homepage "https://github.com/LaButteRonde/homebrew-murmur"

  depends_on arch: :arm64

  app "Yaya-dict.app"

  # Mise à jour sans friction : l'instance en cours est quittée proprement
  # avant le remplacement (TERM en filet), puis relancée par le postflight.
  # L'ancien identifiant (Murmure, avant 0.22.0) est quitté aussi : au premier
  # lancement, Yaya-dict déplace ses dossiers et Murmure ne doit plus tourner.
  uninstall quit:   ["fr.yayadev.yaya-dict", "com.murmur.app"],
            signal: [["TERM", "fr.yayadev.yaya-dict"], ["TERM", "com.murmur.app"]]

  postflight do
    system_command "/usr/bin/xattr",
      args: ["-dr", "com.apple.quarantine", "#{appdir}/Yaya-dict.app"],
      sudo: false
    system_command "/usr/bin/open",
      args: ["-a", "#{appdir}/Yaya-dict.app"],
      sudo: false
  end

  zap trash: [
    "~/Library/Application Support/fr.yayadev.yaya-dict",
    "~/Library/Caches/fr.yayadev.yaya-dict",
    "~/Library/WebKit/fr.yayadev.yaya-dict",
    "~/Library/Preferences/fr.yayadev.yaya-dict.plist",
    "~/Library/Application Support/com.murmur.app",
    "~/Library/Caches/com.murmur.app",
    "~/Library/WebKit/com.murmur.app",
    "~/Library/Preferences/com.murmur.app.plist",
  ]
end
