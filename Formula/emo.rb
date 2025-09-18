class Emo < Formula
  desc "CLI tool for finding and managing emojis with AI-powered selection"
  homepage "https://github.com/redaphid/emo"
  url "https://api.github.com/repos/redaphid/emo/tarball/v2.3.0"
  sha256 "4ec677dec0ec91213df185dd629f169b05471f779e475c40bbd06f3e639060cd"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "build", "--release", "--locked"
    bin.install "target/release/emo"
  end

  test do
    # Test basic functionality
    assert_match "🔥", shell_output("#{bin}/emo fire")

    # Test help output
    assert_match "CLI for finding emojis", shell_output("#{bin}/emo --help")

    # Test version output
    assert_match version.to_s, shell_output("#{bin}/emo --version")
  end
end