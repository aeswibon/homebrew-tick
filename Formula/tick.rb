class Tick < Formula
  desc "Jira TUI dashboard for the terminal"
  homepage "https://github.com/aeswibon/tick"
  version "0.8.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aeswibon/tick/releases/download/v0.8.0/tick-aarch64-apple-darwin"
      sha256 "3632ef5188c172f69d9376155fefc32fa95e62032e02bf700ad9c78fc25cda81"
    else
      url "https://github.com/aeswibon/tick/releases/download/v0.8.0/tick-x86_64-apple-darwin"
      sha256 "0a7c7817a5cb1e032b1c09859bdb03fd203f477a2d83d1cc4d2306e3c6bd1304"
    end
  end

  on_linux do
    url "https://github.com/aeswibon/tick/releases/download/v0.8.0/tick-x86_64-unknown-linux-gnu"
    sha256 "f5ba06e97a61a769b519b7257575356fe5a1fd530e654af76417e9fef393cb4b"
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
