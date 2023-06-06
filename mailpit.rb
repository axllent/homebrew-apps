class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.6.17"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.17/mailpit-darwin-amd64.tar.gz"
      sha256 "627cc3a3b95588c0ae4acf83434db2985ddc04fb79652464ee58c8bab2f4b35a"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.17/mailpit-darwin-arm64.tar.gz"
      sha256 "21a6a6673f2328806c995a1894822f377cb38c33f33758657496ade8f289e6f5"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.17/mailpit-linux-386.tar.gz"
      sha256 "2de9d0d6876c92ac26fd739735dbbd8d3c1a57a82440d4ebf6a1d80df1ddf1f0"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.17/mailpit-linux-amd64.tar.gz"
      sha256 "989d81d5582cebec5635491231a287a2914bd4b822fea7fbe3ec7e33b30bba32"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.17/mailpit-linux-arm.tar.gz"
      sha256 "c31196236295a5615ff9289fffb5e0e567b8f9aadbc15987d8c7e5bd66e481f8"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.17/mailpit-linux-arm64.tar.gz"
      sha256 "6da4d5263f3d5ebf02345b8ca88334959c102ef377b1ea7786a33ae8ce04ca9b"

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
