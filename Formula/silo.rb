# Silo Homebrew Formula Template
# This file is auto-updated by the release workflow

class Silo < Formula
  desc "Secure Terraform State Gateway with mTLS, OIDC, and governance controls"
  homepage "https://github.com/StanleyXie/silo"
  version "0.3.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/StanleyXie/silo/releases/download/v#{version}/silo-darwin-arm64.tar.gz"
      sha256 "6cb80556b471b4b20781fbca648d843bf911ff2c8552402850d3c0e8cfface27"
    else
      url "https://github.com/StanleyXie/silo/releases/download/v#{version}/silo-darwin-amd64.tar.gz"
      sha256 "325300d272ffe3701040417f9da9fc4f8828dc26922376314ea0073a10d472ff"
    end
  end

  on_linux do
    url "https://github.com/StanleyXie/silo/releases/download/v#{version}/silo-linux-amd64.tar.gz"
    sha256 "b403dd8b1bc060d31e33c149bdb0624c42560560070bceb31889e7f58700de06"
  end

  def install
    bin.install "silo"
    
    # Install default config to etc
    (etc/"silo").install "silo.yaml" if File.exist?("silo.yaml")
  end

  def caveats
    <<~EOS
      Silo has been installed!
      
      To start Silo:
        silo
      
      Default config location: #{etc}/silo/silo.yaml
      
      For mTLS, you'll need to generate certificates:
        cd /path/to/silo && ./certs/generate_internal.sh
    EOS
  end

  test do
    system "#{bin}/silo", "--help"
  end
end
