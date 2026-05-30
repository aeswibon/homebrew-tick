class Tick < Formula
  desc "Jira TUI dashboard for the terminal"
  homepage "https://github.com/aeswibon/tick"
  version "0.7.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aeswibon/tick/releases/download/v0.7.1/tick-aarch64-apple-darwin"
      sha256 "83d321d67b9d8db22179c052a41b98b39afae23a88ddb9074cb1ce3d4849f3ef"
    else
      url "https://github.com/aeswibon/tick/releases/download/v0.7.1/tick-x86_64-apple-darwin"
      sha256 "8110e8a1dfaac6fb455a31a471877dab0211de8548a3ea9b85e82a1dfa08e108"
    end
  end

  on_linux do
    url "https://github.com/aeswibon/tick/releases/download/v0.7.1/tick-x86_64-unknown-linux-gnu"
    sha256 "5fa7e62921ca3a1afb3d7eb9364020ec2fc5edc541e0feaadc14d3103916e5a7"
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
