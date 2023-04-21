class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.6.2"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.2/mailpit-darwin-amd64.tar.gz"
      sha256 "166b97ba4733ee6525300dd5f8b2ec7f83434071cc83f510f81c3643e0794e82"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.2/mailpit-darwin-arm64.tar.gz"
      sha256 "03e041d1b5ef093d8681186a4d6dcc0534c30fe0dee0b108129d7a895153e451"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.2/mailpit-linux-386.tar.gz"
      sha256 "989e7aa033773d0049dbfdd6dcf07f5ee4124b9311ecfe28ae708c8527708976"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.2/mailpit-linux-amd64.tar.gz"
      sha256 "a9e1607b9ba5bc6b7e54ed18f15735bc1d2f036d9c17bf89cd353bc432d5b130"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.2/mailpit-linux-arm.tar.gz"
      sha256 "d7cb856328ee7207b1f334cb7f6a7421d91b84d569d674b63c09904dbb00a0f4"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.2/mailpit-linux-arm64.tar.gz"
      sha256 "2527a72858752d26e686889cfdc4fc6cbf3bcdaaf469876f97109e2e77d8152b"

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
