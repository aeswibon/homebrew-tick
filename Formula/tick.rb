class Tick < Formula
  desc "Jira TUI dashboard for the terminal"
  homepage "https://github.com/aeswibon/tick"
  version "0.6.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aeswibon/tick/releases/download/v0.6.7/tick-aarch64-apple-darwin"
      sha256 "b8637d63c4bc615c378a792eeedf1f56aa688227b88267f6319fe447023d091b"
    else
      url "https://github.com/aeswibon/tick/releases/download/v0.6.7/tick-x86_64-apple-darwin"
      sha256 "1dc633e7a43ffd99d9ae03591c5933face0562526095a5f6c22a13ced7843e6c"
    end
  end

  on_linux do
    url "https://github.com/aeswibon/tick/releases/download/v0.6.7/tick-x86_64-unknown-linux-gnu"
    sha256 "9c8ab22b3b0ed5a4a4de70879974b29adae1115edd2b77b388f940672c21ca4d"
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
