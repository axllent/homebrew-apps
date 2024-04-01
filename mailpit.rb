class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.15.1"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.15.1/mailpit-darwin-amd64.tar.gz"
      sha256 "15a11a2cc8515a72d7030cd6b721f974b0e34a0a7322fe93a436585ba4a846f3"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.15.1/mailpit-darwin-arm64.tar.gz"
      sha256 "346bc1bb909650544e9235f6a26c9bf52e606286a03d6f6d587bb736403d121f"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.15.1/mailpit-linux-386.tar.gz"
      sha256 "8aabf86bb5661851e801f631a8be529f172a52c493aba6f07642c1f2e9088b65"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.15.1/mailpit-linux-amd64.tar.gz"
      sha256 "3013e9a9b2e86d8a3dc3ac47b4cdabe9f2679cd49a05e966c60759fb6756017d"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.15.1/mailpit-linux-arm.tar.gz"
      sha256 "42a4587847eaf40241898a23fb2d770bd89e2c20745d2ea07312f5306723594a"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.15.1/mailpit-linux-arm64.tar.gz"
      sha256 "5d435ca70ec3dd430ab893be7c9534a573c6b76d9bd95ca533942729fea30f8f"

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
