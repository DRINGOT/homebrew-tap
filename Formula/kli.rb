class Kli < Formula
  desc "Kubernetes Lens Interface - Universal CLI UI"
  homepage "https://github.com/DRINGOT/kli"
  url "https://github.com/DRINGOT/kli/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "7d9a67fe5ee22b8ce2d1af7e8a2a9c5885c188fae62e25b2407ac6de5a9f51b7"
  license "GPL-3.0"

  depends_on "fzf"
  depends_on "kubernetes-cli"
  depends_on "jq"

  def install
    # On installe d'abord les fichiers dans le dossier bin de Homebrew
    # Homebrew s'occupe de créer le dossier bin s'il n'existe pas
    bin.install "kli"
    bin.install "kli-ui"
    bin.install "kli-engine"
    bin.install "kli-ctx"
    bin.install "kli-ns"

    # ENSUITE on change les permissions sur les fichiers installés
    # On utilise #{bin} pour cibler le bon chemin final
    chmod 0755, "#{bin}/kli"
    chmod 0755, "#{bin}/kli-ui"
    chmod 0755, "#{bin}/kli-engine"
    chmod 0755, "#{bin}/kli-ctx"
    chmod 0755, "#{bin}/kli-ns"

    # Création du fichier VERSION dans le préfixe de l'installation
    (prefix/"VERSION").write "0.0.1"
  end

  test do
    system "#{bin}/kli", "--help"
  end
end
