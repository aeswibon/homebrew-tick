class Tick < Formula
  desc "Jira TUI dashboard for the terminal"
  homepage "https://github.com/aeswibon/tick"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aeswibon/tick/releases/download/v0.1.0/tick-aarch64-apple-darwin"
      sha256 "e5afde0fe4909ad600202e894025b7e29440f205985f2b9425d31ea3aed0bf12"
    else
      url "https://github.com/aeswibon/tick/releases/download/v0.1.0/tick-x86_64-apple-darwin"
      sha256 "e827486164a837650c2b17c5d33d5162e0aedc55e6e1fee91c95a70cdbe30c43"
    end
  end

  on_linux do
    url "https://github.com/aeswibon/tick/releases/download/v0.1.0/tick-x86_64-unknown-linux-gnu"
    sha256 "12b0edd6a318f02118f24dce4564adbd482215354162ccb8241d994c320ca2e4"
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
