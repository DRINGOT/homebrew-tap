class Kli < Formula
  desc "Kubernetes Lens Interface - Interactive terminal UI for Kubernetes"
  homepage "https://github.com/DRINGOT/kli"
  url "https://github.com/DRINGOT/kli/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "a6a60d3036236794c0c5ccc90c049fa3f688927d9b02189230bc595608cdebc5"
  license "GPL-3.0"

  depends_on "fzf"
  depends_on "kubernetes-cli"

  def install
    bin.install "kli"
    bin.install "kli-ui"
    bin.install "kli-engine"
    bin.install "kli-ctx"
    bin.install "kli-ns"
    bin.install "kli-top"
    bin.install "kli-node"
    bin.install "kli-find"
    bin.install "kli-completion"
    (prefix/"VERSION").write "0.2.0"
  end

  def caveats
    <<~EOS
      To enable shell completion, add to your ~/.zshrc or ~/.bashrc:
        source #{opt_bin}/kli-completion

      Optional: install jq for node resource requests/limits breakdown:
        brew install jq
    EOS
  end

  test do
    system "#{bin}/kli", "--version"
  end
end
