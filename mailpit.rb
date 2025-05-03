class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.24.2"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.24.2/mailpit-darwin-amd64.tar.gz"
      sha256 "6f5358ccad5b1bb6f63eaca1d5d3793cc29ae47e0c91aa8b0d0437b57ae307c7"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.24.2/mailpit-darwin-arm64.tar.gz"
      sha256 "c8f2f9f55a842464f83f6b11aeae25c7fca5b5312fa1cebb4ae3dad82cdad368"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.24.2/mailpit-linux-386.tar.gz"
      sha256 "c037002168be028e633c5c5d6008e5d9c0a434356073501e5a4cedc528fa5aca"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.24.2/mailpit-linux-amd64.tar.gz"
      sha256 "147e40d927840f5b7254cd25d59f6d0fb4309612fad0ce1e9a12ea2e5c3d521c"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.24.2/mailpit-linux-arm.tar.gz"
      sha256 "39329a99c04aea9f7603480be044c589b17a3f18f5c0c7af043174f6fee71adf"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.24.2/mailpit-linux-arm64.tar.gz"
      sha256 "fd19219b425436d568544f85f111d9b72d207dc02585dbaef16b72ab1951a9e0"

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
