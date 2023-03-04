class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.3.10"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.3.10/mailpit-darwin-amd64.tar.gz"
      sha256 "694a70aff6e1a9126feb6dab65f5834162aa4f52c5ba832442ac0f00fea788b9"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.3.10/mailpit-darwin-arm64.tar.gz"
      sha256 "231772ed9aaf42e207fb59df3c16905ad721673927903cdf0a2e15257631699c"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.3.10/mailpit-linux-386.tar.gz"
      sha256 "90436cd6e4f07f2628be730a8cc5cf20d9c1895722b1ef2a17839e4017852807"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.3.10/mailpit-linux-amd64.tar.gz"
      sha256 "02d2c2da3d4ef15bba017ee7bdb28c1d1aec75d3efaee29c6d2c42463c839549"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.3.10/mailpit-linux-arm.tar.gz"
      sha256 "0ee2ae2875f844ef7ea78dff3988b116f5d398170f0494bf21d696c7ba32ea46"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.3.10/mailpit-linux-arm64.tar.gz"
      sha256 "a3a9195b9fa0c2539c5fca6b896741320e53e84040042e28eed4f059b8991ff8"

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
