class Tick < Formula
  desc "Jira TUI dashboard for the terminal"
  homepage "https://github.com/aeswibon/tick"
  version "0.12.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aeswibon/tick/releases/download/v0.12.2/tick-aarch64-apple-darwin"
      sha256 "37f61e74ccdce4af77a6714320e7d1f0e7c9bb730a20d3b18c398bd3a1b5a64d"
    else
      url "https://github.com/aeswibon/tick/releases/download/v0.12.2/tick-x86_64-apple-darwin"
      sha256 "f1aac0d5070f35e178ad568e99ac2316582a28792de2f4fe9863d89f010f19ea"
    end
  end

  on_linux do
    url "https://github.com/aeswibon/tick/releases/download/v0.12.2/tick-x86_64-unknown-linux-gnu"
    sha256 "71a4ccec1994f4e3996a3b46be9a0fca47c1912661e1d4950960bf88d7dc24c7"
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
