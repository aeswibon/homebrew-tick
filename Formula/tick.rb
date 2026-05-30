class Tick < Formula
  desc "Jira TUI dashboard for the terminal"
  homepage "https://github.com/aeswibon/tick"
  version "0.25.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aeswibon/tick/releases/download/v0.25.0/tick-aarch64-apple-darwin"
      sha256 "2e36b9b10bbae46e09fa40c2a2e8b82619e3610fd650394e6224f5cade41eefe"
    else
      url "https://github.com/aeswibon/tick/releases/download/v0.25.0/tick-x86_64-apple-darwin"
      sha256 "c65487c7f4fd39b2e05a9e32975158e5eb3100b9c5c94fe40469a1528159459f"
    end
  end

  on_linux do
    url "https://github.com/aeswibon/tick/releases/download/v0.25.0/tick-x86_64-unknown-linux-gnu"
    sha256 "e8b8710aab5f8bdcdca31334dc53ca916e1ed49f14d05d4809ea3845ab58776c"
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
