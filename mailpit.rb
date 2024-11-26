class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.21.5"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.21.5/mailpit-darwin-amd64.tar.gz"
      sha256 "cb3f6cea75589ca249a7a46f711a2e88b54cf660fdd1255a8224b444ed085e88"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.21.5/mailpit-darwin-arm64.tar.gz"
      sha256 "ca1f9634b7539f90616c538d15d442da874fbcf33b71e8d8b43a053802b63213"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.21.5/mailpit-linux-386.tar.gz"
      sha256 "8f587c712976ea01df2f3428e258ff71542635add200d9bec9772743741eb071"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.21.5/mailpit-linux-amd64.tar.gz"
      sha256 "b3123e954b5beb6b02f9100d47afc9c3f03cfd787a42f4dea022aad200d15ae8"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.21.5/mailpit-linux-arm.tar.gz"
      sha256 "073e8e7a3f42903d1ba4fa8a657452feee9c53d2dd95df95d995ff8c83f30be0"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.21.5/mailpit-linux-arm64.tar.gz"
      sha256 "a7b8f8842699a1ae9586410e6de318d270c2e826977614808d261d3330fe0b21"

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
