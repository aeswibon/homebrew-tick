class Tick < Formula
  desc "Jira TUI dashboard for the terminal"
  homepage "https://github.com/aeswibon/tick"
  version "1.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aeswibon/tick/releases/download/v1.3.0/tick-aarch64-apple-darwin"
      sha256 "5683a07025cd4092133bac555a3e56f7c982ef6e6aba641afaff5d9623e45353"
    else
      url "https://github.com/aeswibon/tick/releases/download/v1.3.0/tick-x86_64-apple-darwin"
      sha256 "efec0425e8243928898d0563632ec6e1e22b0a9c159682299400981466a7aee6"
    end
  end

  on_linux do
    url "https://github.com/aeswibon/tick/releases/download/v1.3.0/tick-x86_64-unknown-linux-gnu"
    sha256 "2e34147ae492fa1cf81c7bd5e98bce639506cddb88b04c08ec80b472b86abc45"
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
