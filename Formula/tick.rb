class Tick < Formula
  desc "Jira TUI dashboard for the terminal"
  homepage "https://github.com/aeswibon/tick"
  version "0.9.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aeswibon/tick/releases/download/v0.9.1/tick-aarch64-apple-darwin"
      sha256 "07e701bf956058ac4eb42f89f24443bef078045e109001d965f5224104bd0ddf"
    else
      url "https://github.com/aeswibon/tick/releases/download/v0.9.1/tick-x86_64-apple-darwin"
      sha256 "953543e0c57fec2cda5b528f96d00f695040ed403b9a72032a4c522096e23376"
    end
  end

  on_linux do
    url "https://github.com/aeswibon/tick/releases/download/v0.9.1/tick-x86_64-unknown-linux-gnu"
    sha256 "ab8f3ce039c82039e142dd2421479149177d36ad2b9fb3c200801ebe982f81dc"
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
