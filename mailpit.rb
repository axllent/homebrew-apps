class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.8.0"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.8.0/mailpit-darwin-amd64.tar.gz"
      sha256 "b6c490cdf71731c8a8c0dbb0f6ffc1a469d860ed03123c8c653ba63269ea1dde"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.8.0/mailpit-darwin-arm64.tar.gz"
      sha256 "c5d28400546190a51cc9e9ac946843d70deef77111516503bd324c688b2d1399"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.8.0/mailpit-linux-386.tar.gz"
      sha256 "44f3eebdcbefec2a76f3a03c5b0d45ace002a66b758f58d8d31a0c42b07a7b96"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.8.0/mailpit-linux-amd64.tar.gz"
      sha256 "a8be505eedc5f581585072a8bc6cee41df6c041815e019dd55ce4d3c1629887f"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.8.0/mailpit-linux-arm.tar.gz"
      sha256 "89cbf2f279e8c1535d108a93eb9edb8d37dbb30812d439366b1ba6e6d1221201"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.8.0/mailpit-linux-arm64.tar.gz"
      sha256 "6eb41099747acf07fef65aa826d5175f8d30fe0e33b26a4a59876b6df5534268"

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
