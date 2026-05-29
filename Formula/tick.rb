class Tick < Formula
  desc "Jira TUI dashboard for the terminal"
  homepage "https://github.com/aeswibon/tick"
  version "0.6.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aeswibon/tick/releases/download/v0.6.3/tick-aarch64-apple-darwin"
      sha256 "01225d8bad976c975940aae8b710d5f668336953624b2e971907b0adf9f85a1a"
    else
      url "https://github.com/aeswibon/tick/releases/download/v0.6.3/tick-x86_64-apple-darwin"
      sha256 "9941f0034058ed74bd8e600b3517ceabcfdf739c42a7557c2098c8c45f365ceb"
    end
  end

  on_linux do
    url "https://github.com/aeswibon/tick/releases/download/v0.6.3/tick-x86_64-unknown-linux-gnu"
    sha256 "8943aa53eeb5eba68b722e8bf33f299617a0d157547c30cf26fce955659d4f5a"
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
