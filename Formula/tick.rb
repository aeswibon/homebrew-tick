class Tick < Formula
  desc "Jira TUI dashboard for the terminal"
  homepage "https://github.com/aeswibon/tick"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aeswibon/tick/releases/download/v0.5.0/tick-aarch64-apple-darwin"
      sha256 "99aae0c3a532e88809fcddac53c7436a84eb6887e0b7444d4dfb3424640fe6bd"
    else
      url "https://github.com/aeswibon/tick/releases/download/v0.5.0/tick-x86_64-apple-darwin"
      sha256 "01f89a346c00172da7f0c929972362a0a47aa5015207f555150699e1ab341f94"
    end
  end

  on_linux do
    url "https://github.com/aeswibon/tick/releases/download/v0.5.0/tick-x86_64-unknown-linux-gnu"
    sha256 "88d421a287d2293d27c1663d1d03eb51ae193528000983ebb38a4869f80efc9f"
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
