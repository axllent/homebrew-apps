class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.6.5"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.5/mailpit-darwin-amd64.tar.gz"
      sha256 "404b3d49c3dd8c7dc288bca005194e930aa52f77e5410feae46e96bc9a4ba6c7"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.5/mailpit-darwin-arm64.tar.gz"
      sha256 "249541ce970cd48aae62881d56ee52bb52af1854912b4540f0783823c934fb39"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.5/mailpit-linux-386.tar.gz"
      sha256 "efeacf3e0d12c995751086f99bf62f39eee67bdaabb534b8a674c02eda9c6fe3"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.5/mailpit-linux-amd64.tar.gz"
      sha256 "163dc218fb36234227571c619aac872ca8629ae45852f0022d473e4ab4a441e8"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.5/mailpit-linux-arm.tar.gz"
      sha256 "4203507bbf17fff47afdda012270bf322cda067e746e362abb689320d22deb5a"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.5/mailpit-linux-arm64.tar.gz"
      sha256 "a4f89e358c4afb8e76a2cb670c325d60a811f5c6de3b1fb29e659238bacaeeab"

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
