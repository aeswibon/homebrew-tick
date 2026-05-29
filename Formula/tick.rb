class Tick < Formula
  desc "Jira TUI dashboard for the terminal"
  homepage "https://github.com/aeswibon/tick"
  version "0.6.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aeswibon/tick/releases/download/v0.6.4/tick-aarch64-apple-darwin"
      sha256 "ffa901a7ed778857499244fd092bd4cd4618bfa3f0b984b9fc619522848b78be"
    else
      url "https://github.com/aeswibon/tick/releases/download/v0.6.4/tick-x86_64-apple-darwin"
      sha256 "06a36999ef001503a210ff28f0e8feddc31b14eb8552a62146175f1a90c1d06b"
    end
  end

  on_linux do
    url "https://github.com/aeswibon/tick/releases/download/v0.6.4/tick-x86_64-unknown-linux-gnu"
    sha256 "07416a15758e8eba44f4753b36ec126602ce8d2111a1cb9150e860d650631d8c"
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
