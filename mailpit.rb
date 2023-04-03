class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.5.4"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.5.4/mailpit-darwin-amd64.tar.gz"
      sha256 "98c99af846acfc2e4997224d8d57147ebb8c553b32fed8ce60169729d6b43115"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.5.4/mailpit-darwin-arm64.tar.gz"
      sha256 "19a175e0244aff14c59bde9d99d945c9461c6dffd024931515283d3b18fabe69"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.5.4/mailpit-linux-386.tar.gz"
      sha256 "075958cc9f8f24dfa4ed0ad8e760973700e7b88dffd96f02c54f884931678a0a"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.5.4/mailpit-linux-amd64.tar.gz"
      sha256 "6fbf400e2eb00132ed7cc6beb4ca1c30341eeafb2c9322585d2774437bcdd4ec"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.5.4/mailpit-linux-arm.tar.gz"
      sha256 "e7a9e458800f7af37d3e60e146c133db19029795250c5f4d50db0c6542f07fbe"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.5.4/mailpit-linux-arm64.tar.gz"
      sha256 "f4aa0b363bba3465506e9dbc5aaae26e5da53497dc8f5cb6f4f98f3480a94df7"

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
