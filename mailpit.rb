class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.9.1"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.9.1/mailpit-darwin-amd64.tar.gz"
      sha256 "3321c11d06445b01c593c5a22b7738c32f4bcc3532fac5775e8f1ba0af6b8c28"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.9.1/mailpit-darwin-arm64.tar.gz"
      sha256 "03e6fe0ab1b4e562544d82d8ab485e807ca6df05aaa5936adc225803769dd03f"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.9.1/mailpit-linux-386.tar.gz"
      sha256 "39892a87362e88753147eb7d029eab3aa4f97d0b04ec1e67dff988f1a92e71b0"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.9.1/mailpit-linux-amd64.tar.gz"
      sha256 "ccb4a7e43db39fd22aee40199bfb947e377875b557b7494c56b01ff1cd73016d"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.9.1/mailpit-linux-arm.tar.gz"
      sha256 "b17de4be9bfbe17b9a78a1ba5134deb7912dff9adcbd627223dd8e04720b3ef3"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.9.1/mailpit-linux-arm64.tar.gz"
      sha256 "2ee95c10637050c9ba1a3a5304624d2a279fd6d349d32209c2d5cccff68a6d31"

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
