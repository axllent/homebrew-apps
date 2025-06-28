class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.27.0"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.27.0/mailpit-darwin-amd64.tar.gz"
      sha256 "297233ef9ca0c38b04247e3aa1ce903a5824ca29d09f2d71995cf22aea069966"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.27.0/mailpit-darwin-arm64.tar.gz"
      sha256 "c9b88d7cdef56afbb9d29a5066a7f80e88215ac5642202b5769708dc1b3519d1"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.27.0/mailpit-linux-386.tar.gz"
      sha256 "60adee8a026397ccc71f7d1105f2ff208b8114928757c8a7dd710199038f7468"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.27.0/mailpit-linux-amd64.tar.gz"
      sha256 "629d29442499976ebe271570bac07106c2a0667ba37d2358efbbaff25fd583a1"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.27.0/mailpit-linux-arm.tar.gz"
      sha256 "535764fc53c46e6af0de4e5de4a9f7c04111e5ff367a711c3f0d66e9cf3734c3"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.27.0/mailpit-linux-arm64.tar.gz"
      sha256 "ac5312fd83151fe4e758c3de52a58a2bca8c85f83d7494cb82f27a8d303617a7"

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
