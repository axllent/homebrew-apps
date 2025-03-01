class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.23.0"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.23.0/mailpit-darwin-amd64.tar.gz"
      sha256 "ea5389cee2ac11492428044c0699635cc1cb8e122b7b7578d00933702837cc43"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.23.0/mailpit-darwin-arm64.tar.gz"
      sha256 "8c83c0ffa248b354d9b0b2495ef7e9ea7c2d8f1e0be686763be0b049960a8e8f"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.23.0/mailpit-linux-386.tar.gz"
      sha256 "b0ddaf2e1912fd5184da6c4bee958b47ca0a52c14107648108f324066dcbe8d7"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.23.0/mailpit-linux-amd64.tar.gz"
      sha256 "c00516ceba8feb2021d7a4ccd6e353bb5f1e64a2007b11f57fa66f05d173a4c1"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.23.0/mailpit-linux-arm.tar.gz"
      sha256 "975fb43a04d3f6715f21ab341301b92164718ae73c51b93e95126be5a8571bbc"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.23.0/mailpit-linux-arm64.tar.gz"
      sha256 "6bdbec0d344c545de1c7e4bb5e5c43983d4fb93cbaaffe7ae57bf560c1237e72"

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
