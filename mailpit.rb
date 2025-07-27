class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.27.2"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.27.2/mailpit-darwin-amd64.tar.gz"
      sha256 "22a8966948a4c858d83d7ce0d8b5680270807b00deb3f6aef2a53cac4d26ee2a"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.27.2/mailpit-darwin-arm64.tar.gz"
      sha256 "3ab0b8f784391def9c493def5e22de35dfb3636d09d9e50ea0ac26f2510be3e9"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.27.2/mailpit-linux-386.tar.gz"
      sha256 "c0ffdd02be5dcb4184da92519d6a9ae03f85d5290bd4d72ffc64115d0123bf67"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.27.2/mailpit-linux-amd64.tar.gz"
      sha256 "80500ccbf3ec3db3c85507451b3be0fe8566fa4eb728f63a210cab8166a175d1"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.27.2/mailpit-linux-arm.tar.gz"
      sha256 "7326bc5d65f5aa749ec4234e454d0be242d1646cee13675e81a0c0274b9b293c"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.27.2/mailpit-linux-arm64.tar.gz"
      sha256 "d14c804c14c7a65ebbe382fcc4a592bfcd246a336b9bc6332de02a5f557ff9dd"

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
