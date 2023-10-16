class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.9.8"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.9.8/mailpit-darwin-amd64.tar.gz"
      sha256 "40a82d691dbfda1694d824740939b00c5c9bb20c649629c9b936fd8c6c40c021"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.9.8/mailpit-darwin-arm64.tar.gz"
      sha256 "4a4dffcc7b3a6b4fc50deb14380fd134cc95f1d157cbfa96325b08c8e67f5879"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.9.8/mailpit-linux-386.tar.gz"
      sha256 "79cae6dce68c7f9b1dc57401473462debf913d716d5e0522208f094852ca3b17"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.9.8/mailpit-linux-amd64.tar.gz"
      sha256 "a146d3f04da26b2a2f068adee45f35b7ffd9693befe4de7efa4e628602d4e12c"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.9.8/mailpit-linux-arm.tar.gz"
      sha256 "6fe29962d6b251e493e61655de0a71cdb4842ad5aeaf4c1e60d4694291ca8451"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.9.8/mailpit-linux-arm64.tar.gz"
      sha256 "ed2ec4fbeade481008b0522cc9a9b41e82c26ee1f7882c0ad3ae56ccfa304a76"

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
