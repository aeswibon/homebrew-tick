class Tick < Formula
  desc "Jira TUI dashboard for the terminal"
  homepage "https://github.com/aeswibon/tick"
  version "0.17.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aeswibon/tick/releases/download/v0.17.0/tick-aarch64-apple-darwin"
      sha256 "dd463f81eeeb082539c9f160cd28bac6fa81d8342cc9bce45f82a28536ce840c"
    else
      url "https://github.com/aeswibon/tick/releases/download/v0.17.0/tick-x86_64-apple-darwin"
      sha256 "9ae52d90cfcb8406060f6ed8ff02f8818d7cf244726a794c700ab017aa8bee45"
    end
  end

  on_linux do
    url "https://github.com/aeswibon/tick/releases/download/v0.17.0/tick-x86_64-unknown-linux-gnu"
    sha256 "11f43a2d1749d995c4e79a521b6b91bfc3c037c9bff47a8fd9311026fd9379d3"
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
