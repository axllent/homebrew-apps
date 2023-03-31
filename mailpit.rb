class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.5.1"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.5.1/mailpit-darwin-amd64.tar.gz"
      sha256 "f1984293f950305888d684ecfc64a3b1771998c558c46b4dc7bc2ed3a466c7fd"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.5.1/mailpit-darwin-arm64.tar.gz"
      sha256 "6f119fd58a4e0114792bad5c3561d469ddf0e8d3db6900eda9c04c7807d6b9b2"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.5.1/mailpit-linux-386.tar.gz"
      sha256 "a0a0f88eb88ecc78f8dd4fbe36fc2d3d827e29452dc476d9e55e50d3d2a0acdf"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.5.1/mailpit-linux-amd64.tar.gz"
      sha256 "348afab4dc61f9ffb26b22cc0230b6c7b5192183e8b8b5579b6c63be4d5f2542"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.5.1/mailpit-linux-arm.tar.gz"
      sha256 "8eaece24b824e747c8999df8b5c0b0906f5b9112d29f5cf9bd48ccdf068a4283"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.5.1/mailpit-linux-arm64.tar.gz"
      sha256 "11989240f8b5ed01408c2c1f02596b084c2b18fcb72b9ac6a5b131d1acda93a6"

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
