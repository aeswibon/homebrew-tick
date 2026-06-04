class Tick < Formula
  desc "Jira TUI dashboard for the terminal"
  homepage "https://github.com/aeswibon/tick"
  version "1.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aeswibon/tick/releases/download/v1.2.1/tick-aarch64-apple-darwin"
      sha256 "0ad7ae855c6dfcc637bbd6c48a1d5ab0d65eb3117533fa3a11146d810259bf94"
    else
      url "https://github.com/aeswibon/tick/releases/download/v1.2.1/tick-x86_64-apple-darwin"
      sha256 "6d7eecf3830ebdfb3329ba858a2244893289e46904a99e15c8d51b526ffb6f73"
    end
  end

  on_linux do
    url "https://github.com/aeswibon/tick/releases/download/v1.2.1/tick-x86_64-unknown-linux-gnu"
    sha256 "bc17f7bd5cd4470c086f64ac778150947737339153a42e338247fa61021a627a"
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
