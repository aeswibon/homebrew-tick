class Tick < Formula
  desc "Jira TUI dashboard for the terminal"
  homepage "https://github.com/aeswibon/tick"
  version "0.15.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aeswibon/tick/releases/download/v0.15.0/tick-aarch64-apple-darwin"
      sha256 "c6041eaa738b25e5213336bb6485a713f363f72a26115ccd234da1abf6f9fa74"
    else
      url "https://github.com/aeswibon/tick/releases/download/v0.15.0/tick-x86_64-apple-darwin"
      sha256 "12295265592883097232a6c651ab726dc1a54fca6493cd538aaaa4bd77670262"
    end
  end

  on_linux do
    url "https://github.com/aeswibon/tick/releases/download/v0.15.0/tick-x86_64-unknown-linux-gnu"
    sha256 "369cb52c41306425821e5248c110a162cc94932b8675f5a3729696e59f242d10"
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
