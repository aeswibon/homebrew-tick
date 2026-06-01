class Tick < Formula
  desc "Jira TUI dashboard for the terminal"
  homepage "https://github.com/aeswibon/tick"
  version "1.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aeswibon/tick/releases/download/v1.1.0/tick-aarch64-apple-darwin"
      sha256 "ce0f4b93c4f9a99644295d3830978688b300e7c0e5b34f74bd53ee94e7fd125f"
    else
      url "https://github.com/aeswibon/tick/releases/download/v1.1.0/tick-x86_64-apple-darwin"
      sha256 "4f7f0de7ec4317f308ca3d1f585f644f5098a21a048aa13c2300533c0d1c8131"
    end
  end

  on_linux do
    url "https://github.com/aeswibon/tick/releases/download/v1.1.0/tick-x86_64-unknown-linux-gnu"
    sha256 "6ca4f42ce49e1cc08d0d577cd264d70351a3cdf382541724325d35dba85ece3b"
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
