class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.25.0"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.25.0/mailpit-darwin-amd64.tar.gz"
      sha256 "f0f22324e29d5a0512053f0acf0186c9d5bcc2ecb7232966c5d0b13432f97812"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.25.0/mailpit-darwin-arm64.tar.gz"
      sha256 "5fe3012e9b3c47670e76b456a2b21f8d50b7fb71eaf35af54bd93fb95b9a6165"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.25.0/mailpit-linux-386.tar.gz"
      sha256 "eff51bbd50af1969c6c8104bd0fecff5c63f85f11d40726f084e5f9d0583859d"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.25.0/mailpit-linux-amd64.tar.gz"
      sha256 "539deb2c87b56d3775ab5ab1e433b84f1fa07b35fe998bae353b144338cc9779"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.25.0/mailpit-linux-arm.tar.gz"
      sha256 "53ccbe175fe8abb9c779831e6115522899f60cbee5a9fdb2858e86b0c4c7792d"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.25.0/mailpit-linux-arm64.tar.gz"
      sha256 "4901a7d5edabf4a33ed5c0a56777ae76d451618aa7f4f9dff08fda6f925a75b4"

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
