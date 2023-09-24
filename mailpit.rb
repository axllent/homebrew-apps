class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.9.2"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.9.2/mailpit-darwin-amd64.tar.gz"
      sha256 "84bc372a0d47f15fe5d307e5f26d0505a9360fa11178aa46a3900f04f98c03ed"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.9.2/mailpit-darwin-arm64.tar.gz"
      sha256 "7494778e6e2cf8d90431c421174ef012c693412ee8329441174c86d7479bb0e5"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.9.2/mailpit-linux-386.tar.gz"
      sha256 "7bd86478a8c1ccc0e208c8c807cf9da609f65f44be87e20d8bca3579d1e550c3"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.9.2/mailpit-linux-amd64.tar.gz"
      sha256 "8ba3a960725081d873cac05d339a4d2a323d03833ffd086a3b904c5619dd4212"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.9.2/mailpit-linux-arm.tar.gz"
      sha256 "b92dad427d567ee86bfdb9532e947d1b0200364442c97714753708447c07d662"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.9.2/mailpit-linux-arm64.tar.gz"
      sha256 "c522148210524d0b838c6fd27643642465117648bd27e4bcf455031f0b385c5a"

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
