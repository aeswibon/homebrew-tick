class Tick < Formula
  desc "Jira TUI dashboard for the terminal"
  homepage "https://github.com/aeswibon/tick"
  version "0.7.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aeswibon/tick/releases/download/v0.7.2/tick-aarch64-apple-darwin"
      sha256 "0497f29cdea4eb1cf1009190c6087ab271851445526a5fa43a5866d6e4e2f472"
    else
      url "https://github.com/aeswibon/tick/releases/download/v0.7.2/tick-x86_64-apple-darwin"
      sha256 "4260103b0b41cf1824ba840d16156225695f2127ee6c72eaceaf8b5e96542384"
    end
  end

  on_linux do
    url "https://github.com/aeswibon/tick/releases/download/v0.7.2/tick-x86_64-unknown-linux-gnu"
    sha256 "8e7570f4e03ac2d45e877a31a6b22b3bf4ddcd722c2a875c8dee457e0003e4ab"
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
