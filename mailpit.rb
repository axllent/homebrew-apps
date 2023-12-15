class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.11.0"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.11.0/mailpit-darwin-amd64.tar.gz"
      sha256 "c6aff11dce1d761111f1b50d051a3b06264a0e4119e54324df034329f7dcf1fa"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.11.0/mailpit-darwin-arm64.tar.gz"
      sha256 "fc2a8e879f98ecf50304d98f327ae5346fc10d9bcc6b1c59f52d4ee65480fdcd"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.11.0/mailpit-linux-386.tar.gz"
      sha256 "50456fb66cfb757cc84f0e72f3931a31df3ba1cc0c3f9982ac4339f3b52c29b0"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.11.0/mailpit-linux-amd64.tar.gz"
      sha256 "da100b9e07bdeb847dcbbb186852b7a45cd3222f97f25e04a71e50b9987bc9d9"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.11.0/mailpit-linux-arm.tar.gz"
      sha256 "4e6811b7f5ec1be49a1c217a4825a2410ab188e1cc8f69362bcfefc16c1769c8"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.11.0/mailpit-linux-arm64.tar.gz"
      sha256 "0da9ac452490e2797fc2efe3856f68f688de65a15a08f600efe0aa8d02945a9b"

      def install
        bin.install "mailpit"
      end
    end
  end

  service do
    run opt_bin/"mailpit"
    keep_alive true
    log_path var/"log/mailpit.log"
    error_log_path var/"log/mailpit.log"
  end

  test do
    address = "127.0.0.1:#{free_port}"
    fork { exec "#{bin}/mailpit", "--listen", address }
    sleep 2

    output = shell_output("curl --silent #{address}")
    assert_match "<title>Mailpit</title>", output
  end
end
