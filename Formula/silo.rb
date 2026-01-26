# Silo Homebrew Formula Template
# This file is auto-updated by the release workflow

class Silo < Formula
  desc "Secure Terraform State Gateway with mTLS, OIDC, and governance controls"
  homepage "https://github.com/StanleyXie/silo"
  version "0.3.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/StanleyXie/silo/releases/download/v#{version}/silo-darwin-arm64.tar.gz"
      sha256 "9132f8dc96c38748c8d394165e478393697bc59879688f6e18aebeec74bf1deb"
    else
      url "https://github.com/StanleyXie/silo/releases/download/v#{version}/silo-darwin-amd64.tar.gz"
      sha256 "84d87e143120c49f082fe6afbb2897604012136b20325f29dae48d63c1c5664c"
    end
  end

  on_linux do
    url "https://github.com/StanleyXie/silo/releases/download/v#{version}/silo-linux-amd64.tar.gz"
    sha256 "413a88c4e335f8ee368ff7f323f8ae29e0ba68618d94adb06b03312737bfeba6"
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
