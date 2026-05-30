class Tick < Formula
  desc "Jira TUI dashboard for the terminal"
  homepage "https://github.com/aeswibon/tick"
  version "0.11.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aeswibon/tick/releases/download/v0.11.1/tick-aarch64-apple-darwin"
      sha256 "f2236c524d3a8ea20c9a60ad0052f03cc357f2908cc32fa8245286d12bb7b08e"
    else
      url "https://github.com/aeswibon/tick/releases/download/v0.11.1/tick-x86_64-apple-darwin"
      sha256 "4722e775f4c4ae523274cceb0a894ad0f05fa9787e2a255f767e5e78456d843b"
    end
  end

  on_linux do
    url "https://github.com/aeswibon/tick/releases/download/v0.11.1/tick-x86_64-unknown-linux-gnu"
    sha256 "c7407740fa2c750dee1b93f4b94e63a8f18867235221418dc90a39702a0e737d"
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
