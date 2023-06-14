class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.6.19"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.19/mailpit-darwin-amd64.tar.gz"
      sha256 "5a90e53df47c52f638f41d731be4365092a56b39300e05390976dfc4f08980eb"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.19/mailpit-darwin-arm64.tar.gz"
      sha256 "cfe6cd7dbf7ebb0352c122d3426e02d23a7afdaaf5f31e67b506a977691b0ba2"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.19/mailpit-linux-386.tar.gz"
      sha256 "bea39e4f8bbbe2cb2fd6d660860408088d5c4dfa8be1af32fd8ab529635db28c"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.19/mailpit-linux-amd64.tar.gz"
      sha256 "82256751e23de80943e8bdfb3b45a019178ff4b512e61b0e56f5d51a05258bcf"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.19/mailpit-linux-arm.tar.gz"
      sha256 "cde3074a9629fa2ecb071dd8002dae7c48fc3820f166e48228d5a65a1078ec13"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.19/mailpit-linux-arm64.tar.gz"
      sha256 "651f4832ebf4f6bc53a7265dc18a0a119370b574632a0340f289dd5d090f1ed5"

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
