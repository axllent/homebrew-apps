class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.24.0"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.24.0/mailpit-darwin-amd64.tar.gz"
      sha256 "a19a688a0eeaacd2b16260309026d6e85487e262dbf8078144764f9f1aff2714"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.24.0/mailpit-darwin-arm64.tar.gz"
      sha256 "26798e2e0b6e1f837712f679fc61e47d669dca4a5ed6351c347c5051cb816193"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.24.0/mailpit-linux-386.tar.gz"
      sha256 "92fb7753209c3402d0abb641f336c090c0ffc3d3bf4ec44522f41e48c203c7ce"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.24.0/mailpit-linux-amd64.tar.gz"
      sha256 "44fa197cd56a3ea1bf54f5c61f05ce542c52032b120a7fe03739a24486ae2d48"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.24.0/mailpit-linux-arm.tar.gz"
      sha256 "e175071b744515847c022b211e913d0d4d158929fb7f1d88f72f18880985dce5"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.24.0/mailpit-linux-arm64.tar.gz"
      sha256 "454cd9fbd1c42c277e0bea0bcf63ca17328ed9174183646601a9bf211ff51144"

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
