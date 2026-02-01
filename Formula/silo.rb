# Silo Homebrew Formula Template
# This file is auto-updated by the release workflow

class Silo < Formula
  desc "Secure Terraform State Gateway with mTLS, OIDC, and governance controls"
  homepage "https://github.com/StanleyXie/silo"
  version "0.3.25"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/StanleyXie/silo/releases/download/v#{version}/silo-darwin-arm64.tar.gz"
      sha256 "219c7191b2773ccc4be98b495ec2488a35cfe54e5e8f49bdf1941949fd2c8dd2"
    else
      url "https://github.com/StanleyXie/silo/releases/download/v#{version}/silo-darwin-amd64.tar.gz"
      sha256 "5fb5b4f9f29aa5df4286b3647fb36252c21f9110e10309c587f4a33e916d3829"
    end
  end

  on_linux do
    url "https://github.com/StanleyXie/silo/releases/download/v#{version}/silo-linux-amd64.tar.gz"
    sha256 "9ffa6a08b9bde05ce28bb7fe6b54591cb7e7938e95982ba2e6b41a129570f4a9"
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
