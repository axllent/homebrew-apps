class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.6.13"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.13/mailpit-darwin-amd64.tar.gz"
      sha256 "49080c1be3af0b3dec0474e531997ca08ebead9be7d269c6560b795e9a72a289"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.13/mailpit-darwin-arm64.tar.gz"
      sha256 "30d5cfd7681d5daa9c3055ff12eb367276e713515a403d713fc4c7f4a82e9a45"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.13/mailpit-linux-386.tar.gz"
      sha256 "df71b66e1a291d9a7279c7450d4c3051797c25517a656ee41c3c9af6d0ad0c76"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.13/mailpit-linux-amd64.tar.gz"
      sha256 "b25176b4366850d6d2cd5191a5ccb8bb31ff191ddf89de76da217cc12a60558e"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.13/mailpit-linux-arm.tar.gz"
      sha256 "0218b998a55abb4f79062ea106812c408a3f86d77c21d6371c95c7fe54bc420a"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.13/mailpit-linux-arm64.tar.gz"
      sha256 "05aa4e4a644a0c7674a2b7f1cd57503a270b2ec3483709237dde6184f6bc860f"

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
