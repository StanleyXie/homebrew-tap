class Chronicle < Formula
  desc "AI conversation history extraction and observability tool"
  homepage "https://github.com/StanleyXie/chronicle"
  url "https://github.com/StanleyXie/chronicle/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "3d88ed8581a634b356f52bb7440ac9c66545edde2fd4c7f3c7e2e1bf6fb71802"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "chronicle #{version}", shell_output("#{bin}/chronicle --version")
  end
end
