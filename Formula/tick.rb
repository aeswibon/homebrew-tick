class Tick < Formula
  desc "Jira TUI dashboard for the terminal"
  homepage "https://github.com/aeswibon/tick"
  version "1.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aeswibon/tick/releases/download/v1.2.0/tick-aarch64-apple-darwin"
      sha256 "30a857e54f684f27f6602fba5bf523e9e97647f834b9903a6a80569a5095b067"
    else
      url "https://github.com/aeswibon/tick/releases/download/v1.2.0/tick-x86_64-apple-darwin"
      sha256 "edb7afff701c29897d55cc3635cb90152ab22751d7ed7cfb354264194e04c8be"
    end
  end

  on_linux do
    url "https://github.com/aeswibon/tick/releases/download/v1.2.0/tick-x86_64-unknown-linux-gnu"
    sha256 "c4ffe2c05f57ab00fbe0fb4a8c205deb4481497ab16bc40a4a0e545b833bf98d"
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
