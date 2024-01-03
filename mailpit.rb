class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.12.1"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.12.1/mailpit-darwin-amd64.tar.gz"
      sha256 "7c1f8bdfb7721af64819c94851fad64a71693b14db061fd2d097bff2705599be"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.12.1/mailpit-darwin-arm64.tar.gz"
      sha256 "9887dc8cab216f8b230c4b8c2382c154522bdc362256a2b1bd2e78fca0b7f8ce"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.12.1/mailpit-linux-386.tar.gz"
      sha256 "15b9b56bf9b1756cedc59143cb882ccd643db67099302a80b6cb4bfbf19d9ac3"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.12.1/mailpit-linux-amd64.tar.gz"
      sha256 "9d417b94087d594fe88de53dc9b7f4aa40ac7afcba347d90256ae2938cd44a49"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.12.1/mailpit-linux-arm.tar.gz"
      sha256 "47b85489e0e9b6167f2a456c93b1cb172f278adebfec550a54620ad730a3dd67"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.12.1/mailpit-linux-arm64.tar.gz"
      sha256 "105daffbee61593c2d335ed5ddf19b96f5ee21c54022fe7621d6a2ec6afe111c"

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
