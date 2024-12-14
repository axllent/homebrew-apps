class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.21.7"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.21.7/mailpit-darwin-amd64.tar.gz"
      sha256 "218ddb15dfad5aa1d0a6f7945c325dbd7da2c7c89f961769a18ebc3b9e55bc5d"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.21.7/mailpit-darwin-arm64.tar.gz"
      sha256 "82668c0f0e93b83dff9dd4230d4a24eb48a6f088a876e43be63f516e1a1c3ec0"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.21.7/mailpit-linux-386.tar.gz"
      sha256 "437050537566054994ce6f0ba93d6bfa99fb9b802cb1e463986d4ec57a031ea8"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.21.7/mailpit-linux-amd64.tar.gz"
      sha256 "db0aaee98c6720e4b7d8d43283767ccb326d60af3e0dc93d74a17fd479fdc908"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.21.7/mailpit-linux-arm.tar.gz"
      sha256 "938ebed5698a8b7d35cf9de1cb4e8f8858c5d94649263f5ad4cf5420cf3ded51"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.21.7/mailpit-linux-arm64.tar.gz"
      sha256 "cc9f180d4d189dac8961e3a85fcd0860c285e83bc6b6299d203397e82486ce28"

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
