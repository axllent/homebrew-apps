class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.26.1"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.26.1/mailpit-darwin-amd64.tar.gz"
      sha256 "219bc601afd66bfa2cb1e38afc661b1561f9d661a86631d1098f525e0b5a0f5b"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.26.1/mailpit-darwin-arm64.tar.gz"
      sha256 "13106ad8f67bd283963f42b83a6fa9c0aa086baae52dcc2cf014fd434d63375f"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.26.1/mailpit-linux-386.tar.gz"
      sha256 "78468b6733b1917488399e8b43bdebf6a8f41f9823146575fee92f3ff5ee09c4"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.26.1/mailpit-linux-amd64.tar.gz"
      sha256 "5bf82e9cc9f61536fd619adb82004918ee95fcae09f7bf8025f9f617c1b0d87b"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.26.1/mailpit-linux-arm.tar.gz"
      sha256 "683175de627b3d44f65b269b232439fa6d49f84d0b85a41313eed9c7997ec41a"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.26.1/mailpit-linux-arm64.tar.gz"
      sha256 "aafe1cd3dda8359ff3f25a410fdef63879cfca61cfcf65f6d2c885b04e778994"

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
