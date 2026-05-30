class Tick < Formula
  desc "Jira TUI dashboard for the terminal"
  homepage "https://github.com/aeswibon/tick"
  version "0.24.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aeswibon/tick/releases/download/v0.24.0/tick-aarch64-apple-darwin"
      sha256 "3b3fa240657caabe26814b69457f2ee22a5e65e4676d6cc2734cc12c18b711e1"
    else
      url "https://github.com/aeswibon/tick/releases/download/v0.24.0/tick-x86_64-apple-darwin"
      sha256 "b0b7596e00abfd559eaeedb1c6a8d572f2e6b36a5055a3990db08611a67026c5"
    end
  end

  on_linux do
    url "https://github.com/aeswibon/tick/releases/download/v0.24.0/tick-x86_64-unknown-linux-gnu"
    sha256 "9270ec7f32e197e1427e7b97bc6fbe08e2f8003de48d6271d1cd158afeb3d085"
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
