class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.6.21"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.21/mailpit-darwin-amd64.tar.gz"
      sha256 "6c42009c1c909821b71ab65976964c3d915bf324d4d7c6407dfbd3a8bd9b1061"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.21/mailpit-darwin-arm64.tar.gz"
      sha256 "744b35c72b9bfcb5b336f6a4a4164f2c4c88e6c4deb1aa8af6b7e292582884f3"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.21/mailpit-linux-386.tar.gz"
      sha256 "40f8477a8138151be67e76de09be3157d40a3b8ee13e5cb5f6080577045eec83"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.21/mailpit-linux-amd64.tar.gz"
      sha256 "43380315b1f43e1fac916405ee0ff5f0d9bb096dfabdb5cf3ae4a3491ccc4ce5"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.21/mailpit-linux-arm.tar.gz"
      sha256 "727b47910d8fc753856bc830b435945d7c0a75d7daf8c402703b1801b874c915"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.21/mailpit-linux-arm64.tar.gz"
      sha256 "ac2e234be3a460c4f867cee6ace02d176b66fdf3b9edfcbcdd9c5e9497cd5ba1"

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
