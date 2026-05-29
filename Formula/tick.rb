class Tick < Formula
  desc "Jira TUI dashboard for the terminal"
  homepage "https://github.com/aeswibon/tick"
  version "0.3.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aeswibon/tick/releases/download/v0.3.1/tick-aarch64-apple-darwin"
      sha256 "c341d94051abde51909534844e8ea6c05cc374bbb1686b4185bc6c8250310f79"
    else
      url "https://github.com/aeswibon/tick/releases/download/v0.3.1/tick-x86_64-apple-darwin"
      sha256 "f50088ea080187414781a2482a9ea861728e7b7d1e5cea87eff2bb519a5c0f19"
    end
  end

  on_linux do
    url "https://github.com/aeswibon/tick/releases/download/v0.3.1/tick-x86_64-unknown-linux-gnu"
    sha256 "067c81b2e4ffcc43b05c125628c4e0c4e21fd0dfb7a4ae47b7ece0e3b96c7f31"
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
