class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.6.16"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.16/mailpit-darwin-amd64.tar.gz"
      sha256 "e97615b980b4179d3b18f514aa62ff0339e0899763507e290f6561358e1f7424"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.16/mailpit-darwin-arm64.tar.gz"
      sha256 "365a3dcd242b19554204b417138f7c7f6cf22e322ecdf5260efe3c9ee9e70696"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.16/mailpit-linux-386.tar.gz"
      sha256 "81ff4b3442c18d4193a093c1d7745fc509b3070367e1871dafbf5604d0c8ac25"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.16/mailpit-linux-amd64.tar.gz"
      sha256 "71f938796bfa89cd94f19339b28f1da7beb08931c000c9502d3e1891879969b2"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.16/mailpit-linux-arm.tar.gz"
      sha256 "308d7919adec1de9e73148784957437a54ae569c75f7041503454aeca560cd29"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.16/mailpit-linux-arm64.tar.gz"
      sha256 "75c5a300e8b1eb1db8785f7918b8acf8c9796cf4f1d9adda6951899e43ef9251"

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
