class Tick < Formula
  desc "Jira TUI dashboard for the terminal"
  homepage "https://github.com/aeswibon/tick"
  version "0.16.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aeswibon/tick/releases/download/v0.16.0/tick-aarch64-apple-darwin"
      sha256 "b63d6795cc66c66c0eb78fc9d40e7c261f79b31c7e18404313e8e72c92d85b7a"
    else
      url "https://github.com/aeswibon/tick/releases/download/v0.16.0/tick-x86_64-apple-darwin"
      sha256 "3fc3607929108f150b796ffedb6bc477544d887132ec10ad3a1646a72c19f735"
    end
  end

  on_linux do
    url "https://github.com/aeswibon/tick/releases/download/v0.16.0/tick-x86_64-unknown-linux-gnu"
    sha256 "40b549d5156f9fbf6aed950806cdc3ab1994179eeb85073837fac724703d6e19"
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
