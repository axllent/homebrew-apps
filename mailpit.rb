class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.8.1"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.8.1/mailpit-darwin-amd64.tar.gz"
      sha256 "8e81673c66a39daa4c00dce70b159ef9cd3927bed076273b044ee8c9e23fec8a"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.8.1/mailpit-darwin-arm64.tar.gz"
      sha256 "faa3b39ba4a1153089b33be302b6ba1562f681271cb7d448bfc52d69c986eeda"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.8.1/mailpit-linux-386.tar.gz"
      sha256 "7659e78e347af4c36502e2da39269781a9e0a90da601d650c54122a1d79597dd"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.8.1/mailpit-linux-amd64.tar.gz"
      sha256 "7b74cec41025339c15ae86e24a1498d2e2326df58b6c0cf99d46b4a702019f67"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.8.1/mailpit-linux-arm.tar.gz"
      sha256 "534534d239394aa6d6b77cd1d9917d2cc4a1a23453e7893043b50b355e1da8fb"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.8.1/mailpit-linux-arm64.tar.gz"
      sha256 "dd7c66e0821897c13c56aab48ee8a893c631a7f84d668bbaa671c6bcd8c510e8"

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
