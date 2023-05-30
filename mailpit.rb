class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.6.12"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.12/mailpit-darwin-amd64.tar.gz"
      sha256 "a10299d4b0e092861d49cb75162c856f0348e2441c9db0d4b69d3d8b4385b7db"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.12/mailpit-darwin-arm64.tar.gz"
      sha256 "46e80cd93e3ccd8e9d623d38094c781f660e9e8dfa4cc2ccf41f4bbfc6c54300"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.12/mailpit-linux-386.tar.gz"
      sha256 "7c66b6a081ad811a71486d1332524ab0335abcae7f2e76ec1341cb1078424464"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.12/mailpit-linux-amd64.tar.gz"
      sha256 "d4f0c54f0107bf7bc67c421c1e043dc718e8014a1489752f02f256bae9223890"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.12/mailpit-linux-arm.tar.gz"
      sha256 "403f55e80244b7d179ad3c59872d60e4e2759c25c1493faf336f2e8bb50e587b"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.12/mailpit-linux-arm64.tar.gz"
      sha256 "627feb454d1cfc64dd337949af83face27a63831823399e3ff3854af23f92253"

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
