# homebrew-yaya-dict

Tap Homebrew officiel de **Yaya-dict** (anciennement Murmure) — dictée vocale 100 % locale pour macOS
(Whisper + correction LLM, aucune donnée envoyée dans le cloud).

## Installation

```sh
brew tap LaButteRonde/yaya-dict
brew install --cask yaya-dict
```

## Notes

- Apple Silicon uniquement (`arm64`).
- L'app n'est pas signée/notariée : le cask retire l'attribut de quarantaine à
  l'installation.
- Les modèles (Whisper, LLM) se téléchargent depuis l'app (Réglages → Modèles)
  et sont stockés dans `~/Library/Application Support/fr.yayadev.yaya-dict/models`
  (plusieurs Go). `brew uninstall --zap yaya-dict` supprime tout.

## Mise à jour du cask (mainteneurs)

1. Builder et zipper l'app : `Yaya-dict-darwin-arm64-<version>.zip`
2. Créer la release `v<version>` sur CE dépôt avec le zip en asset
3. Mettre à jour `version` et `sha256` dans `Casks/yaya-dict.rb`
