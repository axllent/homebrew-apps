class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.21.0"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.21.0/mailpit-darwin-amd64.tar.gz"
      sha256 "92e53d68f8be21d0ec58d500ed598776e4f3cb2faa38afe4eb7520a8cc346132"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.21.0/mailpit-darwin-arm64.tar.gz"
      sha256 "79e9317dd5d2d245d2787bae25ddaab09970a37b493e38fbb29381c48540eb76"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.21.0/mailpit-linux-386.tar.gz"
      sha256 "592b15d749862803095d0fd897d6cc54ab62f6aac5533c5732be2f8bba43898c"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.21.0/mailpit-linux-amd64.tar.gz"
      sha256 "57a9e13e77ce799c2595391034391e837c538c5d55ab28a93b707bb0140c8362"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.21.0/mailpit-linux-arm.tar.gz"
      sha256 "2f4818b76dcd7c4833d784c907cb1c429d05c8e9766f667617389354f13f4fdb"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.21.0/mailpit-linux-arm64.tar.gz"
      sha256 "a0cad0fe758a28292b77cf5542f494fcb8aca8c67a29488718e1538284615fbb"

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
