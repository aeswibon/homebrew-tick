class Tick < Formula
  desc "Jira TUI dashboard for the terminal"
  homepage "https://github.com/aeswibon/tick"
  version "0.6.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aeswibon/tick/releases/download/v0.6.2/tick-aarch64-apple-darwin"
      sha256 "7192565f9a87ed705f694b2596585c9d5cfdb52c6dac5717f4a08ed60eef9561"
    else
      url "https://github.com/aeswibon/tick/releases/download/v0.6.2/tick-x86_64-apple-darwin"
      sha256 "0fa728762d0583afe594e062dbb41334a9886ebd6f182e8756e546cfbd1587c2"
    end
  end

  on_linux do
    url "https://github.com/aeswibon/tick/releases/download/v0.6.2/tick-x86_64-unknown-linux-gnu"
    sha256 "898b6574420847455d3eace373b50e183614b13ecb67ec54c64e6a2a2517cf13"
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
