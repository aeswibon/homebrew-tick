class Tick < Formula
  desc "Jira TUI dashboard for the terminal"
  homepage "https://github.com/aeswibon/tick"
  version "0.6.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aeswibon/tick/releases/download/v0.6.6/tick-aarch64-apple-darwin"
      sha256 "972a2688b32c29134d0b8abf1bcced64383005037ec245f29ad81a805896707b"
    else
      url "https://github.com/aeswibon/tick/releases/download/v0.6.6/tick-x86_64-apple-darwin"
      sha256 "3d9f556b23102a8c64e39dcec0d9ed2061da1db56bce42d55d35a4c9164e897b"
    end
  end

  on_linux do
    url "https://github.com/aeswibon/tick/releases/download/v0.6.6/tick-x86_64-unknown-linux-gnu"
    sha256 "df4364f08a9fc6739816558517a72fd8ad37c328fba6bd2900e032c0b5b74062"
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
