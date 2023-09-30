class Orogene < Formula
  desc "`node_modules/` package manager and utility toolkit."
  homepage "https://orogene.dev"
  if Hardware::CPU.type == :arm
    url "https://github.com/orogene/orogene/releases/download/v0.3.32/orogene-aarch64-apple-darwin.tar.gz"
    sha256 "7efd048deeb02c043ffa90206450396f5ae6e5086b8aa18bc17db1ab3c207e0e"
  else
    url "https://github.com/orogene/orogene/releases/download/v0.3.32/orogene-x86_64-apple-darwin.tar.gz"
    sha256 "b6dc12bd8de3f8daea8d6b68cc0970aebf7b9d6edf26d8e002137035fe5643c4"
  end
  version "0.3.32"
  license "Apache-2.0"

  def install
    bin.install "oro"

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install *leftover_contents unless leftover_contents.empty?
  end
end
