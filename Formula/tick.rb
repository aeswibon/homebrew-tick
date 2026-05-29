class Tick < Formula
  desc "Jira TUI dashboard for the terminal"
  homepage "https://github.com/aeswibon/tick"
  version "0.6.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aeswibon/tick/releases/download/v0.6.8/tick-aarch64-apple-darwin"
      sha256 "4e39ed971cb1065108f64e755996bf8ede0a58c56dc64746065a897dfb2745c4"
    else
      url "https://github.com/aeswibon/tick/releases/download/v0.6.8/tick-x86_64-apple-darwin"
      sha256 "9898f0957e84a114d76e8738f422366c63eacc105d56729735e54b4d03bbad2b"
    end
  end

  on_linux do
    url "https://github.com/aeswibon/tick/releases/download/v0.6.8/tick-x86_64-unknown-linux-gnu"
    sha256 "15c5e3aea6a0a161cc8bd9dd02d4be04d9a8661c48e5755a9c1af41284daa699"
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
