class Tick < Formula
  desc "Jira TUI dashboard for the terminal"
  homepage "https://github.com/aeswibon/tick"
  version "0.12.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aeswibon/tick/releases/download/v0.12.1/tick-aarch64-apple-darwin"
      sha256 "96324b4e3aa0cfca81a16eab386b0a7e5487693380f826093eeff538dc6ae25a"
    else
      url "https://github.com/aeswibon/tick/releases/download/v0.12.1/tick-x86_64-apple-darwin"
      sha256 "8498cb65be69ba8999ba1a116ff5664f614a8e32db63a453a4e726395792fc7b"
    end
  end

  on_linux do
    url "https://github.com/aeswibon/tick/releases/download/v0.12.1/tick-x86_64-unknown-linux-gnu"
    sha256 "17f5350fbcccf5f6fec738a041345cd08d530a4542fb2de63f56d5c048ed455e"
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
