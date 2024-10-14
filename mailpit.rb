class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.20.6"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.20.6/mailpit-darwin-amd64.tar.gz"
      sha256 "05da5401f353d888152889654266b256fa2d6121cc196fbb2bb71a2510d57a39"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.20.6/mailpit-darwin-arm64.tar.gz"
      sha256 "315347d76cda6140dd4cf8b2512dc0734e5b73024b0b6dfef689e4f7740652f8"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.20.6/mailpit-linux-386.tar.gz"
      sha256 "ac5a5a05762564188cd334e9435ad279918ed3595490ea52c615766052fcfd9f"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.20.6/mailpit-linux-amd64.tar.gz"
      sha256 "5224bd1fe7204cbcf17e8a3a08d2e2b4e02fcdbba358e3b830d30bb693cc06e5"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.20.6/mailpit-linux-arm.tar.gz"
      sha256 "2500b9875f5023bf7c8f1c92e9c1a9e0ee3845f5dc853019c47a156e1bba996c"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.20.6/mailpit-linux-arm64.tar.gz"
      sha256 "1525c2583f3eb823fb8089e5ff04e051034d0be91921521c75a4e7c84309dbb5"

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
