class Tick < Formula
  desc "Jira TUI dashboard for the terminal"
  homepage "https://github.com/aeswibon/tick"
  version "0.9.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aeswibon/tick/releases/download/v0.9.0/tick-aarch64-apple-darwin"
      sha256 "4f3275d322b35cc096dce35f4463c1c0b4c8a7a420d103953570bb7db4aa8f56"
    else
      url "https://github.com/aeswibon/tick/releases/download/v0.9.0/tick-x86_64-apple-darwin"
      sha256 "5682fc5e4cb67722fd4e3f63eefe494848b4591341483691b73e42006c6eda65"
    end
  end

  on_linux do
    url "https://github.com/aeswibon/tick/releases/download/v0.9.0/tick-x86_64-unknown-linux-gnu"
    sha256 "a5baefe34f340feaa571d10e08dbd2683b992136613a33abb4e0ff2099724a06"
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
