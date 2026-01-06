class Chronicle < Formula
  desc "AI conversation history extraction and observability tool"
  homepage "https://github.com/StanleyXie/chronicle"
  version "0.2.2"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/StanleyXie/chronicle/releases/download/v0.2.2/chronicle-darwin-arm64.tar.gz"
    sha256 "b3c301c0bcc0d9d76359d19b8af80d2d0e6914211620fa1ea103a8f3be54207e"
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
