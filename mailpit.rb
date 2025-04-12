class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.24.1"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.24.1/mailpit-darwin-amd64.tar.gz"
      sha256 "606ece9b4a4afb68896d4020487c790b940f84c3bebb110b63e15cc5fb96507c"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.24.1/mailpit-darwin-arm64.tar.gz"
      sha256 "da4f4d59d94d39d5ab6059a391ef21cf5d626370a9fc0faf99cc52ae9c175cdf"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.24.1/mailpit-linux-386.tar.gz"
      sha256 "7dd963bc6020fa775a8d246f7852d5959defd86bb5140a7efb514ab5e5f98fdf"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.24.1/mailpit-linux-amd64.tar.gz"
      sha256 "19a44cdce1be803de72cac3d6f58a0185cdbaf39c3a025d2fabce1195dfc07d2"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.24.1/mailpit-linux-arm.tar.gz"
      sha256 "8e2c2d890c38bcb782b977df488af3d5787cb3fbefff8716c3ed413210b3e8f1"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.24.1/mailpit-linux-arm64.tar.gz"
      sha256 "2a051e32024e8b74b4d637b9dbbf48b7d3f4f6abf2a73bced231b2861d0dd2b1"

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
