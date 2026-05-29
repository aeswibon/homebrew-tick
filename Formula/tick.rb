class Tick < Formula
  desc "Jira TUI dashboard for the terminal"
  homepage "https://github.com/aeswibon/tick"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aeswibon/tick/releases/download/v0.4.0/tick-aarch64-apple-darwin"
      sha256 "02ad36fb799fbfab655c0cce894a1c40bdec3983a259e97e3e6b10c276a9419c"
    else
      url "https://github.com/aeswibon/tick/releases/download/v0.4.0/tick-x86_64-apple-darwin"
      sha256 "07c5045067212118d8f0a456db65e4d7ac9dd54ddaa518b28e977bd05f6b0d5a"
    end
  end

  on_linux do
    url "https://github.com/aeswibon/tick/releases/download/v0.4.0/tick-x86_64-unknown-linux-gnu"
    sha256 "15982a23daa761311911d645ca2344121ec2a99a301b43adbdf12c35d315361b"
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
