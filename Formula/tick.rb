class Tick < Formula
  desc "Jira TUI dashboard for the terminal"
  homepage "https://github.com/aeswibon/tick"
  version "0.4.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aeswibon/tick/releases/download/v0.4.1/tick-aarch64-apple-darwin"
      sha256 "c32e257af89e59a578de3ac64e025d26040c5b2549c983066003771050c1cba8"
    else
      url "https://github.com/aeswibon/tick/releases/download/v0.4.1/tick-x86_64-apple-darwin"
      sha256 "d205cbfb6050c60a62254075bb98b5f53c841bc8fa13ddd472c6d79d79e80536"
    end
  end

  on_linux do
    url "https://github.com/aeswibon/tick/releases/download/v0.4.1/tick-x86_64-unknown-linux-gnu"
    sha256 "cd9eec8df3f3129dd1f4d7df8f8f28ee5e71e6916aaee662ebe6bda1f3b8d3d6"
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
