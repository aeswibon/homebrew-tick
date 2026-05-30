class Tick < Formula
  desc "Jira TUI dashboard for the terminal"
  homepage "https://github.com/aeswibon/tick"
  version "0.15.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aeswibon/tick/releases/download/v0.15.1/tick-aarch64-apple-darwin"
      sha256 "4e9d27f9682785af26e55427785a6707a984fe4eb3036514604ef4470a1dff0e"
    else
      url "https://github.com/aeswibon/tick/releases/download/v0.15.1/tick-x86_64-apple-darwin"
      sha256 "4abcc3a59cde73a4de9b945619b7e117936b1ab7e12da32db18c66739aeb3fce"
    end
  end

  on_linux do
    url "https://github.com/aeswibon/tick/releases/download/v0.15.1/tick-x86_64-unknown-linux-gnu"
    sha256 "b0070d1c6e84bd1c4cf2f5e24e0b2efa75503950904e846653019d621447d324"
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
