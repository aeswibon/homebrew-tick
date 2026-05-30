class Tick < Formula
  desc "Jira TUI dashboard for the terminal"
  homepage "https://github.com/aeswibon/tick"
  version "0.23.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aeswibon/tick/releases/download/v0.23.0/tick-aarch64-apple-darwin"
      sha256 "809505a593f45742595c31651c29c2187c2c8099b2572777a8fce7eccbe2859f"
    else
      url "https://github.com/aeswibon/tick/releases/download/v0.23.0/tick-x86_64-apple-darwin"
      sha256 "04bfd47e784ca7d0c7613e5db75d68df4bde1f00c7fba70f5f1c535c5ed49d6c"
    end
  end

  on_linux do
    url "https://github.com/aeswibon/tick/releases/download/v0.23.0/tick-x86_64-unknown-linux-gnu"
    sha256 "a54461ab91e0086c1c1f25d71eae49ce3919737cb2750135106a3b6673ede9a7"
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
