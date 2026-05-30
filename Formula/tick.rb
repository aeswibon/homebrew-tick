class Tick < Formula
  desc "Jira TUI dashboard for the terminal"
  homepage "https://github.com/aeswibon/tick"
  version "0.19.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aeswibon/tick/releases/download/v0.19.0/tick-aarch64-apple-darwin"
      sha256 "63e3d5e9ff7dfb34bddf9cae606acd4a4ae6681126c03aa76eb501a7276ccc7d"
    else
      url "https://github.com/aeswibon/tick/releases/download/v0.19.0/tick-x86_64-apple-darwin"
      sha256 "c68c894a039a79b14e899861ea8943150b0c46f816515be0ddae60b6252bc5ca"
    end
  end

  on_linux do
    url "https://github.com/aeswibon/tick/releases/download/v0.19.0/tick-x86_64-unknown-linux-gnu"
    sha256 "7c1f8ce8af9da39e0b82247d1870a34c54051e1bfa153ca242cdb69911092583"
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
