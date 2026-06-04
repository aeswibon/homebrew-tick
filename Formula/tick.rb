class Tick < Formula
  desc "Jira TUI dashboard for the terminal"
  homepage "https://github.com/aeswibon/tick"
  version "1.2.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aeswibon/tick/releases/download/v1.2.2/tick-aarch64-apple-darwin"
      sha256 "37b5b35a224e0aeca0f7043b983642ff9433ea2eb676b7cb14cad72731f51cbb"
    else
      url "https://github.com/aeswibon/tick/releases/download/v1.2.2/tick-x86_64-apple-darwin"
      sha256 "a84a46e621455a07e06f363d7591f6cc953375f890c4e3cda8776fbacfc31a3d"
    end
  end

  on_linux do
    url "https://github.com/aeswibon/tick/releases/download/v1.2.2/tick-x86_64-unknown-linux-gnu"
    sha256 "bb889b9e97e5dc4795c42d80fe6f9cf3614ef2d7aed6549ec381fa147dcf106b"
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
