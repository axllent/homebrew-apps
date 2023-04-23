class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.6.3"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.3/mailpit-darwin-amd64.tar.gz"
      sha256 "f6cb098ad49ada2fea1e3d5d25eaf1d07a615a84ec1c186788a70c02e25a8783"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.3/mailpit-darwin-arm64.tar.gz"
      sha256 "73eb110f0fb4cbfd12785e8a26a3522b9d3671f332574db5934a01fd4726a870"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.3/mailpit-linux-386.tar.gz"
      sha256 "54fc0c42a767d94d8dcdcf85e0bd1b7520af92a7c45d8282af72d099fe91d6ba"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.3/mailpit-linux-amd64.tar.gz"
      sha256 "8273448f22777b71d5dcbd15a54075bc60dda2b02921b484a79d8032a2c587fa"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.3/mailpit-linux-arm.tar.gz"
      sha256 "22fa6faa7abf346ef041f7bb56ddd90581e8571ac17e01dfe2ed70ea1c42f472"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.3/mailpit-linux-arm64.tar.gz"
      sha256 "9ce59c1a8048f6bd175e0e805ed299c57869e778201f9929b959779586efaa4c"

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
