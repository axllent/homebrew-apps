class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.27.7"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.27.7/mailpit-darwin-amd64.tar.gz"
      sha256 "2826adafa39212bbf577786ee71438574cd934f8505c5a3d3230da48a66697f9"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.27.7/mailpit-darwin-arm64.tar.gz"
      sha256 "912930b4708d2dcce4170f239516acd65c02d4fa30258ecf0a344b06f77ef6e1"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.27.7/mailpit-linux-386.tar.gz"
      sha256 "01262c4f8ed0ed1b438f587a9a1853ea7cf65a87c64a3be4df16b8010a78283a"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.27.7/mailpit-linux-amd64.tar.gz"
      sha256 "e09e3b704b6047df375389dac88287de02220b2cf0d2ce26589b0539dc3da9d9"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.27.7/mailpit-linux-arm.tar.gz"
      sha256 "b5221aa1cff303c7992eb0fa84d81690d7a2e606259f7b299b64c03044bbbcc0"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.27.7/mailpit-linux-arm64.tar.gz"
      sha256 "ec9fb08cbe5da14b310626842f34c7663a0535d5b69760edc3e7435613efbbef"

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
