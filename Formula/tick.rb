class Tick < Formula
  desc "Jira TUI dashboard for the terminal"
  homepage "https://github.com/aeswibon/tick"
  version "1.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aeswibon/tick/releases/download/v1.0.0/tick-aarch64-apple-darwin"
      sha256 "7eff516227cc162c0fd1072ddc154b4a327f07f57ff526901f686aa335114d7b"
    else
      url "https://github.com/aeswibon/tick/releases/download/v1.0.0/tick-x86_64-apple-darwin"
      sha256 "0ebefa7d798e6336d725b98cf26b58cede752af45b41d04dbff0ef2b76877926"
    end
  end

  on_linux do
    url "https://github.com/aeswibon/tick/releases/download/v1.0.0/tick-x86_64-unknown-linux-gnu"
    sha256 "790b124ed5dbf4b6a6a2bbf490069059c519fbc91b48ed1b817cfe405e85c335"
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
