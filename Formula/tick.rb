class Tick < Formula
  desc "Jira TUI dashboard for the terminal"
  homepage "https://github.com/aeswibon/tick"
  version "0.11.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aeswibon/tick/releases/download/v0.11.0/tick-aarch64-apple-darwin"
      sha256 "7a01ad09263cfa79a9aee3790b3b0c34ca91273bf4132916d143893350978a5c"
    else
      url "https://github.com/aeswibon/tick/releases/download/v0.11.0/tick-x86_64-apple-darwin"
      sha256 "aebff06a0a5df908e7630ff07eda40e6f9ff6e314db834ab756ff3019ba1bb94"
    end
  end

  on_linux do
    url "https://github.com/aeswibon/tick/releases/download/v0.11.0/tick-x86_64-unknown-linux-gnu"
    sha256 "052b4dbe6496e1c6673561b019a948f3bfad270e8988c89200a30db1f9472f5f"
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
