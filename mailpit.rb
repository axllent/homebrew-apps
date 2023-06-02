class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.6.14"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.14/mailpit-darwin-amd64.tar.gz"
      sha256 "ef20c84ccc9eae26d6408f91ba2cd5d8933a822e5d181d7036c71b3c085c1123"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.14/mailpit-darwin-arm64.tar.gz"
      sha256 "9b63de30115a692a2d542f2c1d13885d9849025a322528f0cb03732c70582ba5"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.14/mailpit-linux-386.tar.gz"
      sha256 "5930c8408477dd1ec8a9117d4fded1e792e17395bca24ec40cc843df2a316cad"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.14/mailpit-linux-amd64.tar.gz"
      sha256 "79aace5a2a453ce837351566176e0a3b600da1c1e5a8d8986fceb7d6a68185f1"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.14/mailpit-linux-arm.tar.gz"
      sha256 "671a05a124b4158a63d7ac23a27d4894a154bab1181ee7924c2c20f2203eef5a"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.14/mailpit-linux-arm64.tar.gz"
      sha256 "5739995c4e336ef0641f52280f6e2c1db37d33e157a9247f8cfa829d8ce39410"

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
