class Tick < Formula
  desc "Jira TUI dashboard for the terminal"
  homepage "https://github.com/aeswibon/tick"
  version "1.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aeswibon/tick/releases/download/v1.1.1/tick-aarch64-apple-darwin"
      sha256 "725155d6f08f374483eb11827174e147ae6cdd8b4b167ca62e7070cbab99018f"
    else
      url "https://github.com/aeswibon/tick/releases/download/v1.1.1/tick-x86_64-apple-darwin"
      sha256 "8e1b1fe8e91dec2951ed546b917f9f033ccc2584a1d0538452c368881172f7c1"
    end
  end

  on_linux do
    url "https://github.com/aeswibon/tick/releases/download/v1.1.1/tick-x86_64-unknown-linux-gnu"
    sha256 "86056bb7df0c9a7dd5a59e559149eb988a77ae016c6ea4b51fa990e250b8d724"
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
