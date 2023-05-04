class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.6.7"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.7/mailpit-darwin-amd64.tar.gz"
      sha256 "b0f9bc61e6e103314fa2501d160c6393d86feb8982a9aec7e8a5d112b8b036f7"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.7/mailpit-darwin-arm64.tar.gz"
      sha256 "dd57fb91185391789655d40bc71ac528a1ccbc6ca1497ccfb76c59c0b1ddabcc"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.7/mailpit-linux-386.tar.gz"
      sha256 "b6411fcee6f29a48e9cc3b230a1f9a84329c443a4455834a9483074d2afa264d"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.7/mailpit-linux-amd64.tar.gz"
      sha256 "315e2f33fda1200197ade51b65fa289fa5a2dacaa91b2a052868c9b3be4c8ec6"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.7/mailpit-linux-arm.tar.gz"
      sha256 "8f41537fc88cc399b9d7b1768116b04ead1e71f8120517e28b53792167832d0f"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.7/mailpit-linux-arm64.tar.gz"
      sha256 "8b20588e8a900a698f8ec6835039fede14f8a49d326c543401e1fe3bda01e68d"

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
