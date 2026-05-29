class Tick < Formula
  desc "Jira TUI dashboard for the terminal"
  homepage "https://github.com/aeswibon/tick"
  version "0.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aeswibon/tick/releases/download/v0.6.0/tick-aarch64-apple-darwin"
      sha256 "f78ef884db4d090e97469c2d60e89733fc906acf08b8b93953e4a463ff3742b5"
    else
      url "https://github.com/aeswibon/tick/releases/download/v0.6.0/tick-x86_64-apple-darwin"
      sha256 "48b46814f6cf16fa44f5ed16904e5099ee19732bc8eca590706b808bc96b6767"
    end
  end

  on_linux do
    url "https://github.com/aeswibon/tick/releases/download/v0.6.0/tick-x86_64-unknown-linux-gnu"
    sha256 "f7e2bbe52557225232286f48d4d19368554b8f742fba765a0988c3093e035b80"
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
