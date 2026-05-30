class Tick < Formula
  desc "Jira TUI dashboard for the terminal"
  homepage "https://github.com/aeswibon/tick"
  version "0.21.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aeswibon/tick/releases/download/v0.21.0/tick-aarch64-apple-darwin"
      sha256 "9c919e125bbdbbcdf75e01187e516910b8d11ba7fccf2256b454567b7b898b96"
    else
      url "https://github.com/aeswibon/tick/releases/download/v0.21.0/tick-x86_64-apple-darwin"
      sha256 "a82b095993a6933c8a01714de309272f924f2768f965bef57219266b0872e85d"
    end
  end

  on_linux do
    url "https://github.com/aeswibon/tick/releases/download/v0.21.0/tick-x86_64-unknown-linux-gnu"
    sha256 "dd36178e4f3c77cdacc276c5c4da403fe520811135fcd304fe57a044ba45d88f"
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
