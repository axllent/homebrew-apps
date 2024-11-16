class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.21.3"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.21.3/mailpit-darwin-amd64.tar.gz"
      sha256 "7ef836e209be3b757e069d8a3008dc43ec6058bd9f7f4272bcde138cb4eff3fb"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.21.3/mailpit-darwin-arm64.tar.gz"
      sha256 "5795ab8cdbe74e39937db2b1ba4e3e52e47287ec40f48fac6c2370633106863d"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.21.3/mailpit-linux-386.tar.gz"
      sha256 "7c25e9729ddd8d52d2d73e43f751c323d822d9592fb66adda41bea0c848ab662"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.21.3/mailpit-linux-amd64.tar.gz"
      sha256 "a2ae196e9fcd16f8d94d982b341468d2049c75b7098cec3d8b23ff366a6154d8"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.21.3/mailpit-linux-arm.tar.gz"
      sha256 "bcbb46a541ec3eb6ca97c271ffbaba66c305c99bc1397c3435820a13197f3afe"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.21.3/mailpit-linux-arm64.tar.gz"
      sha256 "fcb8d277421c6e3dd16d8b29be6e0fbb57b846ecf35b52dabf2d6b4f29b3111d"

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
