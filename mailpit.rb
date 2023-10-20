class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.9.9"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.9.9/mailpit-darwin-amd64.tar.gz"
      sha256 "4a47ee17e8d943a0c493ad0f04ba32437f25a74e932a9087eb601856b7bddeb4"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.9.9/mailpit-darwin-arm64.tar.gz"
      sha256 "581e4875e8eacd89a903edca44e72a2dbf962a6184d51303164fa90dbcb0fd52"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.9.9/mailpit-linux-386.tar.gz"
      sha256 "73bdcdeb2319c0f420b9eab79b0dac810f74625f184dbbd1c236e0b28cf9bcb0"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.9.9/mailpit-linux-amd64.tar.gz"
      sha256 "1e067b9e5f3c5bafa9d00b5ff7799ee9178d28c161eb78e105cb9405b2b03cd2"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.9.9/mailpit-linux-arm.tar.gz"
      sha256 "aef234a3600bf8aeb969137502dea7f996e82cd3585a2304ed324c6724446237"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.9.9/mailpit-linux-arm64.tar.gz"
      sha256 "7c8f1c288e0198d2550f7f4dac22ab846f350901763bcffdab3d88dcc1ada847"

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
