# Silo Homebrew Formula Template
# This file is auto-updated by the release workflow

class Silo < Formula
  desc "Secure Terraform State Gateway with mTLS, OIDC, and governance controls"
  homepage "https://github.com/StanleyXie/silo"
  version "0.3.16"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/StanleyXie/silo/releases/download/v#{version}/silo-darwin-arm64.tar.gz"
      sha256 "f2b756a0b72486b6bd971cf74f4749be29d8b038b3feb93a8c1dd8369eb6b986"
    else
      url "https://github.com/StanleyXie/silo/releases/download/v#{version}/silo-darwin-amd64.tar.gz"
      sha256 "2428a34d15f2c271d751718fe8d119584903a2dd3c864b8714774c7619aab1bd"
    end
  end

  on_linux do
    url "https://github.com/StanleyXie/silo/releases/download/v#{version}/silo-linux-amd64.tar.gz"
    sha256 "e1571be4c89fc38b0bcbdc0b8a0e2ebf5554845ebd2044582929143ff1db3f86"
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
