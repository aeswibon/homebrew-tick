class Tick < Formula
  desc "Jira TUI dashboard for the terminal"
  homepage "https://github.com/aeswibon/tick"
  version "1.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aeswibon/tick/releases/download/v1.4.0/tick-aarch64-apple-darwin"
      sha256 "f096dc88f13b615451a7c3404fdd61f2a0039f2e7598da4635f869a3c1d2e0a5"
    else
      url "https://github.com/aeswibon/tick/releases/download/v1.4.0/tick-x86_64-apple-darwin"
      sha256 "9611bc2fc1f3e8d53db5bba169b968ec8dfaf774aa3169e24f99810198bf283d"
    end
  end

  on_linux do
    url "https://github.com/aeswibon/tick/releases/download/v1.4.0/tick-x86_64-unknown-linux-gnu"
    sha256 "dbef432106a99f9d936da1ee6162460751994c4c628f7ba9dd4e285ff89703ed"
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
