class Tick < Formula
  desc "Jira TUI dashboard for the terminal"
  homepage "https://github.com/aeswibon/tick"
  version "0.20.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aeswibon/tick/releases/download/v0.20.0/tick-aarch64-apple-darwin"
      sha256 "88c6512c27057f23002859c3414c806953ef88aa36ca5e0c1d8f8e01b91e1c67"
    else
      url "https://github.com/aeswibon/tick/releases/download/v0.20.0/tick-x86_64-apple-darwin"
      sha256 "2638ef7063f51a752c034dee1bc17828ba4f7eea40bfe842a802d53c93248a10"
    end
  end

  on_linux do
    url "https://github.com/aeswibon/tick/releases/download/v0.20.0/tick-x86_64-unknown-linux-gnu"
    sha256 "d940ce9e54eaa9f1da4318991f597cacb86d3f2edf74033244716a583a5d9859"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "tick-aarch64-apple-darwin" => "tick"
    elsif OS.mac?
      bin.install "tick-x86_64-apple-darwin" => "tick"
    else
      bin.install "tick-x86_64-unknown-linux-gnu" => "tick"
    end
  end

  test do
    assert_match "tick", shell_output("#{bin}/tick --help", 0)
  end
end
