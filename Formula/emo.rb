class Emo < Formula
  desc "CLI tool for finding and managing emojis with AI-powered selection"
  homepage "https://github.com/redaphid/emo"
  url "https://api.github.com/repos/redaphid/emo/tarball/v2.4.0"
  sha256 "b03807467d6443510e813b60b3c14e5ede7cf550baa3d45371b3824c645f3cd1"
  license "MIT"

  depends_on "cmake" => :build
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