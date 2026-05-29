class Tick < Formula
  desc "Jira TUI dashboard for the terminal"
  homepage "https://github.com/aeswibon/tick"
  version "0.5.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aeswibon/tick/releases/download/v0.5.1/tick-aarch64-apple-darwin"
      sha256 "647fd0189e1f34912ece0f3e8885e599489b21ee8656347c7a70e4de982480da"
    else
      url "https://github.com/aeswibon/tick/releases/download/v0.5.1/tick-x86_64-apple-darwin"
      sha256 "dce10bd340aa2e2fc3f65b42f997295c62911b010321f59a3fd02328a4505817"
    end
  end

  on_linux do
    url "https://github.com/aeswibon/tick/releases/download/v0.5.1/tick-x86_64-unknown-linux-gnu"
    sha256 "694a84db4f7a7318148069f54f7adf81f4a833e445535cdb9f2ae039eca58f67"
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
