class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.5.5"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.5.5/mailpit-darwin-amd64.tar.gz"
      sha256 "015ea0bc4488ac5fe0bb8169541cfe943a14b137d0be6328e34bca51af3a082c"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.5.5/mailpit-darwin-arm64.tar.gz"
      sha256 "25bd8fc3b34b0e53a034ea6f94eb50d5f1faa6a215fe20a4ee701157e169889a"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.5.5/mailpit-linux-386.tar.gz"
      sha256 "72ee249c0089afbe55b70711fefbe65d31dcb9487db62370ade6106b06068807"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.5.5/mailpit-linux-amd64.tar.gz"
      sha256 "b1ed9d6ef63d1b129f5c18b7a75d42d6c1a50b56653309bfe1da1980eb9cfb14"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.5.5/mailpit-linux-arm.tar.gz"
      sha256 "d2f65b511a46e3341e347209521bfecb171cbc3a77c29b3f1951fad16e75e034"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.5.5/mailpit-linux-arm64.tar.gz"
      sha256 "c715565d17be2014b7e9a43147eb3602765feee58068dcc3ce88dc2fea41011e"

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
