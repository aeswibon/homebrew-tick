class Tick < Formula
  desc "Jira TUI dashboard for the terminal"
  homepage "https://github.com/aeswibon/tick"
  version "0.22.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aeswibon/tick/releases/download/v0.22.0/tick-aarch64-apple-darwin"
      sha256 "09ae6c7bbe1f39481a48b601a7cedc6e82a081f782eb6f269e3b8c0b40b19de9"
    else
      url "https://github.com/aeswibon/tick/releases/download/v0.22.0/tick-x86_64-apple-darwin"
      sha256 "37629b2a0cffd01ebb2648793fec4d021e839c6280d4ceea909f7ae2a9c6297d"
    end
  end

  on_linux do
    url "https://github.com/aeswibon/tick/releases/download/v0.22.0/tick-x86_64-unknown-linux-gnu"
    sha256 "99a9eca5100859da940df4615e26b3ed43a20d55d4f599af6d338f66eeddf70f"
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
