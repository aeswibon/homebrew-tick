class Tick < Formula
  desc "Jira TUI dashboard for the terminal"
  homepage "https://github.com/aeswibon/tick"
  version "0.4.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aeswibon/tick/releases/download/v0.4.2/tick-aarch64-apple-darwin"
      sha256 "72498f33cbae173e26eb388ecedbdcfb8a93b4bb24b053b500496d5546d90798"
    else
      url "https://github.com/aeswibon/tick/releases/download/v0.4.2/tick-x86_64-apple-darwin"
      sha256 "36901e3a80b6c3c9ae7e12c96ecd0dab5e61bf146e28d4cebcbb207a1338f950"
    end
  end

  on_linux do
    url "https://github.com/aeswibon/tick/releases/download/v0.4.2/tick-x86_64-unknown-linux-gnu"
    sha256 "8b90548b105929f23c4a4a5b23d192023f1f5331328cf4e033f9e2439f96c945"
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
