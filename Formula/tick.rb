class Tick < Formula
  desc "Jira TUI dashboard for the terminal"
  homepage "https://github.com/aeswibon/tick"
  version "0.26.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aeswibon/tick/releases/download/v0.26.0/tick-aarch64-apple-darwin"
      sha256 "0e591bb23cd785256bdc6a67c22e3d155fc82e2148fe8a6be09116f0cc388a4e"
    else
      url "https://github.com/aeswibon/tick/releases/download/v0.26.0/tick-x86_64-apple-darwin"
      sha256 "4f54543b7757287d3aebd4d0143f3198596f61c34fb30a5999409a6df92564d6"
    end
  end

  on_linux do
    url "https://github.com/aeswibon/tick/releases/download/v0.26.0/tick-x86_64-unknown-linux-gnu"
    sha256 "3aa710e78275436193bd88a7275a3520d1810d13c62862ba63683f0bda4f46b3"
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
