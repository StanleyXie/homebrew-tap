class Chronicle < Formula
  desc "AI conversation history extraction and observability tool"
  homepage "https://github.com/StanleyXie/chronicle"
  version "0.2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/StanleyXie/chronicle/releases/download/v#{version}/chronicle-darwin-arm64.tar.gz"
    sha256 "19defccc9a6397617719549f0e6c008855fa209c17469e15f239edf84af51b1a"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/StanleyXie/chronicle/releases/download/v#{version}/chronicle-darwin-amd64.tar.gz"
  else
    url "https://github.com/StanleyXie/chronicle/releases/download/v#{version}/chronicle-linux-amd64.tar.gz"
  end

  license "MIT"

  def install
    bin.install "chronicle"
  end

  test do
    assert_match "chronicle", shell_output("#{bin}/chronicle --help")
  end
end
