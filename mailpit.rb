class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.9.6"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.9.6/mailpit-darwin-amd64.tar.gz"
      sha256 "51f711a0f6071f49b650908007e518b39175876ba40457e699aaedd7042211d3"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.9.6/mailpit-darwin-arm64.tar.gz"
      sha256 "105a1cd62f1ed0ac6bf0321a7d04a3832e4c365bfe51ac53eb9f32dadc9d3c4d"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.9.6/mailpit-linux-386.tar.gz"
      sha256 "7a0fb902b72d8a4b779b125f3e935855dd77b4167fdb03456849a9e20a92922d"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.9.6/mailpit-linux-amd64.tar.gz"
      sha256 "b0e93ae7118d646488032e2e5fa44eee1b91826c38a9207521bf084711dfe3b1"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.9.6/mailpit-linux-arm.tar.gz"
      sha256 "39ccc54c9d06396ebe0aa95ddfe77e7479784b893a3165300d63a971c6be0e94"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.9.6/mailpit-linux-arm64.tar.gz"
      sha256 "9254b90bec3d5a8330e155c07295494e2aa2ccdc8d14e6170a969ff26545ed6b"

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
