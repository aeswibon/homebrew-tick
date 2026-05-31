class Tick < Formula
  desc "Jira TUI dashboard for the terminal"
  homepage "https://github.com/aeswibon/tick"
  version "0.27.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aeswibon/tick/releases/download/v0.27.0/tick-aarch64-apple-darwin"
      sha256 "f5af3de1f119734a25cb9001be9bde4a8b56f04f74195db90a1fcd68519d2c02"
    else
      url "https://github.com/aeswibon/tick/releases/download/v0.27.0/tick-x86_64-apple-darwin"
      sha256 "0203946e51c19c9221cd603be8b6d779a5950a68db79eb5eb6b669dc16a1eae0"
    end
  end

  on_linux do
    url "https://github.com/aeswibon/tick/releases/download/v0.27.0/tick-x86_64-unknown-linux-gnu"
    sha256 "4db2609da63d4b9cc58527f833c03ef929e0544f30769eed61275ef98cec9531"
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
