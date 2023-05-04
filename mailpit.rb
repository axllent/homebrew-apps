class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.6.6"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.6/mailpit-darwin-amd64.tar.gz"
      sha256 "ea3407e39d26cb41f39a927ded2f4aeec3ba1f7f290705a3d81e56e96f33be3b"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.6/mailpit-darwin-arm64.tar.gz"
      sha256 "c6688388b45e888d91a9a6eb2a185e830939c29298703e1b53aaa596cbeba962"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.6/mailpit-linux-386.tar.gz"
      sha256 "f74f7b514612baf6d35ad7729c61d30a812685d45c9d29cf93b046543a2de430"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.6/mailpit-linux-amd64.tar.gz"
      sha256 "7f26c32b4fc6fb3ebc104708babf9865ec258a8a26e800b5e11fb512c554226c"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.6/mailpit-linux-arm.tar.gz"
      sha256 "6e66c3a04264084eb997a2f87f399d20c255fd7e299a9c102ab6e09bd378b5e7"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.6/mailpit-linux-arm64.tar.gz"
      sha256 "0ebbf275fefd137bd32c34e994b5ec558102c0d9580165f54a6d0a0844438b58"

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
