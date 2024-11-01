class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.21.1"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.21.1/mailpit-darwin-amd64.tar.gz"
      sha256 "c97a1307d14615450593fdc0507443e7ed49c05c06b9a636f66cc7eff24c837e"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.21.1/mailpit-darwin-arm64.tar.gz"
      sha256 "5e61cbc718b6852a622522a9015e054367d5d4a489555d9bc1f1823bb9adc0e5"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.21.1/mailpit-linux-386.tar.gz"
      sha256 "9b61206e7104f30913613834e508f3f292d0b5cc54a79366c8a0f0aab2a92eeb"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.21.1/mailpit-linux-amd64.tar.gz"
      sha256 "e01f83aec7a0cfcf9772b9a9ab7ce1c93770c185a35a75b0c42a538b02efa5d0"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.21.1/mailpit-linux-arm.tar.gz"
      sha256 "34de32ad776d1cc9e4aec899612ce58f29448a7aa66b18aa331a979794c933b2"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.21.1/mailpit-linux-arm64.tar.gz"
      sha256 "62ae8725b534874be37e8aa04175c4d4f71737ab946695e70bad5cb6324a05f3"

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
