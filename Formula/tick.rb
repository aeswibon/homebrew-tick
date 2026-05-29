class Tick < Formula
  desc "Jira TUI dashboard for the terminal"
  homepage "https://github.com/aeswibon/tick"
  version "0.4.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aeswibon/tick/releases/download/v0.4.3/tick-aarch64-apple-darwin"
      sha256 "b53cea47fa98e0aac9784bf047f1bc37cd6eef5361af0c0685cb9254faa701c9"
    else
      url "https://github.com/aeswibon/tick/releases/download/v0.4.3/tick-x86_64-apple-darwin"
      sha256 "f642197b77d031ab1a4f272b2d2d0621aaad0daf4edb2ce97bc5582f25729cc7"
    end
  end

  on_linux do
    url "https://github.com/aeswibon/tick/releases/download/v0.4.3/tick-x86_64-unknown-linux-gnu"
    sha256 "fa9adc28206802773edfa3be7aae3bdc4c165f4b76bf0223cbab5c31dabef4c7"
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
