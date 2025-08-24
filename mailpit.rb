class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.27.6"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.27.6/mailpit-darwin-amd64.tar.gz"
      sha256 "6b764b6c589eed48b490b6d173301fe485273604801016f709f7077ae4cc818e"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.27.6/mailpit-darwin-arm64.tar.gz"
      sha256 "f5a14aa21db4896ab9d61829f3367740105d180faf0ee8c03561e2e933277366"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.27.6/mailpit-linux-386.tar.gz"
      sha256 "e363a5a9da58c994df2067996eda4e796de6e277fd976196e58ec1d220a67c87"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.27.6/mailpit-linux-amd64.tar.gz"
      sha256 "89ed051c24045f7fd2d6097fa27ae24911ba3408c1fb6c79ebf738321e325f70"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.27.6/mailpit-linux-arm.tar.gz"
      sha256 "704411ba15691b1b8b382f83f5d9bb81ae0e302beeceedbdebb83ed2a6da7149"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.27.6/mailpit-linux-arm64.tar.gz"
      sha256 "fbb849948b4582bf5e21011b96ebd3801e5dedade6ce59fad3278f5bd88e95ba"

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
