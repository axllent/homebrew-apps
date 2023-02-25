class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.3.9"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.3.9/mailpit-darwin-amd64.tar.gz"
      sha256 "ff9aae62938e039feaddb2f25a6faa90ccc3d605e82e6eaf0a5c4feba0562221"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.3.9/mailpit-darwin-arm64.tar.gz"
      sha256 "ca2ba1f87ccba043d281788cb9e194726f72218d611cb544e8a0d07484a358d8"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.3.9/mailpit-linux-386.tar.gz"
      sha256 "91b4a02c7f7cb926bdb28dc9c3dd5964beecb649fdf130769be2dbe1cbf7ab0b"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.3.9/mailpit-linux-amd64.tar.gz"
      sha256 "cb95623608ca5d4160b87e1f21897f6ac23903fc19f23a5b8b317b4825d2873e"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.3.9/mailpit-linux-arm.tar.gz"
      sha256 "699147a11b143300ba41694539fadacedc077056d73b92c45789f2aad87a2d56"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.3.9/mailpit-linux-arm64.tar.gz"
      sha256 "9100abdbcd116feaf13cecc39b01f424140917f5b927f60ed37e10f9f2c9c367"

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
