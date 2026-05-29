class Tick < Formula
  desc "Jira TUI dashboard for the terminal"
  homepage "https://github.com/aeswibon/tick"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aeswibon/tick/releases/download/v0.2.0/tick-aarch64-apple-darwin"
      sha256 "f58b419e75a83edf1d3cdc96cc3f8eb0c4a76df5b68d1f0d802258bd555b8417"
    else
      url "https://github.com/aeswibon/tick/releases/download/v0.2.0/tick-x86_64-apple-darwin"
      sha256 "fa032ded1a1dcba0957c77f01454cc8bd9971980e5ec080f7e0cbb9078377374"
    end
  end

  on_linux do
    url "https://github.com/aeswibon/tick/releases/download/v0.2.0/tick-x86_64-unknown-linux-gnu"
    sha256 "66a5660309e5d439194ecc49aef3b30bbdeaab30f93ad4659e936ca985e847d8"
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
