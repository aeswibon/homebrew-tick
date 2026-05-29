class Tick < Formula
  desc "Jira TUI dashboard for the terminal"
  homepage "https://github.com/aeswibon/tick"
  version "0.6.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aeswibon/tick/releases/download/v0.6.1/tick-aarch64-apple-darwin"
      sha256 "ab4c5ef4c08d642e02a8062fe0c297d68f6b56c5372212b9b4707f105dae27a6"
    else
      url "https://github.com/aeswibon/tick/releases/download/v0.6.1/tick-x86_64-apple-darwin"
      sha256 "f78f2d2cc95e9cd5aee5533802bfdd83688cc26a3831b1ace9c645c83c238a32"
    end
  end

  on_linux do
    url "https://github.com/aeswibon/tick/releases/download/v0.6.1/tick-x86_64-unknown-linux-gnu"
    sha256 "182ee16e29539787a3e976d2df59965fc4a63961c498438816d19ed7eb031cf6"
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
