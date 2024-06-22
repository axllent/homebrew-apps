class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.18.7"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.18.7/mailpit-darwin-amd64.tar.gz"
      sha256 "e113f385d0dc9a874e1b4f1d550073497fda7c95c384e48e27318d6034b3f2d0"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.18.7/mailpit-darwin-arm64.tar.gz"
      sha256 "deed0dd45bd363030b4b1894874785c7d44c7a49da2665e30d339a2fecc9ffde"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.18.7/mailpit-linux-386.tar.gz"
      sha256 "7c54992ea7948402c97ea8dc6d32d80ac9bac6c7693ab05fa4c399dff2a0c637"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.18.7/mailpit-linux-amd64.tar.gz"
      sha256 "f62293d9712be92b8bed071195ad3607480b7bc6aa5e9a487078a481e05a0dd7"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.18.7/mailpit-linux-arm.tar.gz"
      sha256 "b2e47231bfed75196975305da8c0351d0a747c70dcfa2ef2bd2cf958384c309c"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.18.7/mailpit-linux-arm64.tar.gz"
      sha256 "04ee622f1748b3982fe132c05c115030b5d7db7bde83b29352df1a28e2baf677"

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
