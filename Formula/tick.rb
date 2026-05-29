class Tick < Formula
  desc "Jira TUI dashboard for the terminal"
  homepage "https://github.com/aeswibon/tick"
  version "0.6.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aeswibon/tick/releases/download/v0.6.9/tick-aarch64-apple-darwin"
      sha256 "3732edb8864854f3de6a5500684940350bf766ca58b47617da723aad18449896"
    else
      url "https://github.com/aeswibon/tick/releases/download/v0.6.9/tick-x86_64-apple-darwin"
      sha256 "f4103457cb07a2d821b177b79cfe34831dc2c3152476b4cd30c2793bc5c7c260"
    end
  end

  on_linux do
    url "https://github.com/aeswibon/tick/releases/download/v0.6.9/tick-x86_64-unknown-linux-gnu"
    sha256 "9e15dee6239f5eaa927dee4175c3bcfed4bae6a0079cc2f29a3425b5b8d6f09d"
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
