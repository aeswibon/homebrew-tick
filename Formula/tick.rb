class Tick < Formula
  desc "Jira TUI dashboard for the terminal"
  homepage "https://github.com/aeswibon/tick"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aeswibon/tick/releases/download/v0.3.0/tick-aarch64-apple-darwin"
      sha256 "6a5d5f5e3205ea80d420ebf454e5b0500073642309ec63a1dd9778cd1f135e46"
    else
      url "https://github.com/aeswibon/tick/releases/download/v0.3.0/tick-x86_64-apple-darwin"
      sha256 "c863a0d8aa54cbc16d375de23ae049bf39656e67ce100d533ec4fea6b45656ef"
    end
  end

  on_linux do
    url "https://github.com/aeswibon/tick/releases/download/v0.3.0/tick-x86_64-unknown-linux-gnu"
    sha256 "ec1e587c9b60b44e0b973719e295f3990807e3f3c2550b03b64f9855540f8316"
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
