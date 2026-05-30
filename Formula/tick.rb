class Tick < Formula
  desc "Jira TUI dashboard for the terminal"
  homepage "https://github.com/aeswibon/tick"
  version "0.10.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aeswibon/tick/releases/download/v0.10.0/tick-aarch64-apple-darwin"
      sha256 "1c4bb466f46b3c812d404879b7d7c30db44895a742ea5ab78e0f35c90c27499b"
    else
      url "https://github.com/aeswibon/tick/releases/download/v0.10.0/tick-x86_64-apple-darwin"
      sha256 "3ccf8084def8ecb2dae1699ad2377ac3c329d40b6654dbd24a7c8174b88c7507"
    end
  end

  on_linux do
    url "https://github.com/aeswibon/tick/releases/download/v0.10.0/tick-x86_64-unknown-linux-gnu"
    sha256 "346791efedaabcea736cd65baf7daefdf3fe595af801f2229a64314eb81449dd"
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
