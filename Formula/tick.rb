class Tick < Formula
  desc "Jira TUI dashboard for the terminal"
  homepage "https://github.com/aeswibon/tick"
  version "0.11.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aeswibon/tick/releases/download/v0.11.2/tick-aarch64-apple-darwin"
      sha256 "c8a7d6c1ba3bd0202fb77b0198b9fd8eb2159e1fe25ce0ccc4e9eeb4411426d0"
    else
      url "https://github.com/aeswibon/tick/releases/download/v0.11.2/tick-x86_64-apple-darwin"
      sha256 "ab9af5e1ad88169442d15c67bcf394642fedb675be556113609d22619885f515"
    end
  end

  on_linux do
    url "https://github.com/aeswibon/tick/releases/download/v0.11.2/tick-x86_64-unknown-linux-gnu"
    sha256 "6ace682ce713f1c5ad7aedac00e2d5623836f777b0d7e8623f4a10b9510a90f9"
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
