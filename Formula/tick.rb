class Tick < Formula
  desc "Jira TUI dashboard for the terminal"
  homepage "https://github.com/aeswibon/tick"
  version "0.3.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aeswibon/tick/releases/download/v0.3.2/tick-aarch64-apple-darwin"
      sha256 "d0332da94cdd3816d119043018a723b70bb11bab513ced6e5daeb41eedf54bb3"
    else
      url "https://github.com/aeswibon/tick/releases/download/v0.3.2/tick-x86_64-apple-darwin"
      sha256 "c720ec989e9ac59bd1e333297a99986cffe58101953aa89899f446f091965645"
    end
  end

  on_linux do
    url "https://github.com/aeswibon/tick/releases/download/v0.3.2/tick-x86_64-unknown-linux-gnu"
    sha256 "6c002456d756f1dea4e17365e147dad932228d745ecc8406838767e85f55fdf5"
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
