class Tick < Formula
  desc "Jira TUI dashboard for the terminal"
  homepage "https://github.com/aeswibon/tick"
  version "0.13.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aeswibon/tick/releases/download/v0.13.0/tick-aarch64-apple-darwin"
      sha256 "0321466706fed169c657a3bcec8d98a6a099f2a136cf58783cd63c4073b0d723"
    else
      url "https://github.com/aeswibon/tick/releases/download/v0.13.0/tick-x86_64-apple-darwin"
      sha256 "990835add4866b5d6960253759f74984bcba514d4647a2c1236b8501ca95709a"
    end
  end

  on_linux do
    url "https://github.com/aeswibon/tick/releases/download/v0.13.0/tick-x86_64-unknown-linux-gnu"
    sha256 "11f17ca3821f96e5d417d3af6b7b006b896e9e92b2d10525be30fbff3add5213"
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
