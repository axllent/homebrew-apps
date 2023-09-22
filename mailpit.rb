class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.9.0"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.9.0/mailpit-darwin-amd64.tar.gz"
      sha256 "0db13ca028477426887d25a074a823fdd3bff68be396634f7144d52974c77f4a"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.9.0/mailpit-darwin-arm64.tar.gz"
      sha256 "34ec17f947eeb1eea5fade5bed344cb5c549f4d2c6c8c5c1ca5f261f213e498a"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.9.0/mailpit-linux-386.tar.gz"
      sha256 "523cb163d7cac4a0729177de25e3dd277aa32af2b81357bc07fe0b94692ed0a3"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.9.0/mailpit-linux-amd64.tar.gz"
      sha256 "1efe2b7b71d32cdc0084c81e884338587312f033030883df1b75cf92cd90fb4a"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.9.0/mailpit-linux-arm.tar.gz"
      sha256 "0e5b4a727f7bd6180475f50c9efd942a5a90ac630323b67742f0778bf85a7b9c"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.9.0/mailpit-linux-arm64.tar.gz"
      sha256 "b76188c57bd3fc0453d9b140102a1d3d3b4ffed394b96574f748ea4e2b258040"

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
