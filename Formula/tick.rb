class Tick < Formula
  desc "Jira TUI dashboard for the terminal"
  homepage "https://github.com/aeswibon/tick"
  version "0.18.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aeswibon/tick/releases/download/v0.18.0/tick-aarch64-apple-darwin"
      sha256 "f60895dc9f1ec7fd5202f48fc2f3dce06f874e29c17fe7afe0fd4e4a271b6afc"
    else
      url "https://github.com/aeswibon/tick/releases/download/v0.18.0/tick-x86_64-apple-darwin"
      sha256 "c8e5efe9ae33ba05b4509e04837a3c00585765179c355cd42830b79481f330f7"
    end
  end

  on_linux do
    url "https://github.com/aeswibon/tick/releases/download/v0.18.0/tick-x86_64-unknown-linux-gnu"
    sha256 "3d4fff4e220222a5ada1c1c2809e7a226d6da9bce2a2ce694f06cd7468cc0dc9"
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
