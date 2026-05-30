class Tick < Formula
  desc "Jira TUI dashboard for the terminal"
  homepage "https://github.com/aeswibon/tick"
  version "0.14.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aeswibon/tick/releases/download/v0.14.0/tick-aarch64-apple-darwin"
      sha256 "bbb5413869a9f234800d531a10597624c80eba8baf838d94d621e619ef88e979"
    else
      url "https://github.com/aeswibon/tick/releases/download/v0.14.0/tick-x86_64-apple-darwin"
      sha256 "c288e3274a509a4670e6d25399b842a24d077c04cb63d594cab9e1c08651bfa9"
    end
  end

  on_linux do
    url "https://github.com/aeswibon/tick/releases/download/v0.14.0/tick-x86_64-unknown-linux-gnu"
    sha256 "c4fb26992544f468f15aa69dc28b0c550726a179652dac53963891eebbca3bee"
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
