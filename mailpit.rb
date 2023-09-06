class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.8.4"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.8.4/mailpit-darwin-amd64.tar.gz"
      sha256 "9b02e0244b474ee75c4e2253a5f9f137a3fba029ad62b8cf201a8ffa53001856"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.8.4/mailpit-darwin-arm64.tar.gz"
      sha256 "97b5c54c976714b76c7180111e14cb39c85e01a7d0f023b5d08fc6a954478712"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.8.4/mailpit-linux-386.tar.gz"
      sha256 "559bca162ba2c4d0f41f380dfb51661ca7c46839aeae0958e94569b68c895fed"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.8.4/mailpit-linux-amd64.tar.gz"
      sha256 "bdbf7ed1add6940a7ea898f426fb958e443a5ea30a738feb10e9865b3ea81347"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.8.4/mailpit-linux-arm.tar.gz"
      sha256 "0a46104c27aafb87f9f7d015965cc0c3c048fa17045f9a2f33cb32ae910ef8c3"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.8.4/mailpit-linux-arm64.tar.gz"
      sha256 "09961ee4acbc4dee2a78fc77116dc3fcafc5cce76090fbe6a1ec2abb2fa31199"

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
