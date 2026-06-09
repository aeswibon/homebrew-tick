class Tick < Formula
  desc "Jira TUI dashboard for the terminal"
  homepage "https://github.com/aeswibon/tick"
  version "1.4.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aeswibon/tick/releases/download/v1.4.1/tick-aarch64-apple-darwin"
      sha256 "9ec26418ad432f789367ba6cf683544e85186954c170e67047d4a7c697c31715"
    else
      url "https://github.com/aeswibon/tick/releases/download/v1.4.1/tick-x86_64-apple-darwin"
      sha256 "d449c32a72272e325dd951a62230276339dbb5db167a8d46fb06f57965664393"
    end
  end

  on_linux do
    url "https://github.com/aeswibon/tick/releases/download/v1.4.1/tick-x86_64-unknown-linux-gnu"
    sha256 "aafd35e5f7f4c64f6c9e02e730a8ea78512ef20b8a1a642d7b304b39bf60a1fc"
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
