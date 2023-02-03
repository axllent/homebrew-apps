class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.3.7"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.3.7/mailpit-darwin-amd64.tar.gz"
      sha256 "2d88dd20bc619c21fea0541c6b76ba885c874a8072c39148a3122ac96f40e460"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.3.7/mailpit-darwin-arm64.tar.gz"
      sha256 "48a586425789c36346465baeedecb6248da786f8dbe6c8213aa755df3c5ebb31"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.3.7/mailpit-linux-386.tar.gz"
      sha256 "4542d4d2bfbfc5d6503c6a59e008f1599d18b4c8785443842e8913c5e6c87384"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.3.7/mailpit-linux-amd64.tar.gz"
      sha256 "50782905fade4b44b088a43e2328190c4cca71b9989b2538dfb2402dfe028e8c"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.3.7/mailpit-linux-arm.tar.gz"
      sha256 "b91429facab72277a62e20f00c6cd60d2fd56058f44e440cf1c2645c5255dd6e"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.3.7/mailpit-linux-arm64.tar.gz"
      sha256 "11982f23bde00a5a8ffbb85ca98bf43b6758c82f4b23dc6d5da0f91e0917410a"

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
