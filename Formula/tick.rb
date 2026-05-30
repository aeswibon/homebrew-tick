class Tick < Formula
  desc "Jira TUI dashboard for the terminal"
  homepage "https://github.com/aeswibon/tick"
  version "0.12.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aeswibon/tick/releases/download/v0.12.0/tick-aarch64-apple-darwin"
      sha256 "f0b74cd0c8086b4da13155947e029e9176e0fedddfa26806f2a19b1adc82dbd0"
    else
      url "https://github.com/aeswibon/tick/releases/download/v0.12.0/tick-x86_64-apple-darwin"
      sha256 "1146a5c0e64ae4f07a23b635973bdeef6c6b9d8a3a5fbd95537610797e671165"
    end
  end

  on_linux do
    url "https://github.com/aeswibon/tick/releases/download/v0.12.0/tick-x86_64-unknown-linux-gnu"
    sha256 "9ff1a83ab730359157e22a0f61fe8eb1a16ed1ef4bdd2975cfe51771206c6ba3"
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
