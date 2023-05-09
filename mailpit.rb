class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.6.9"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.9/mailpit-darwin-amd64.tar.gz"
      sha256 "43642fcf5bb621122f7a0fba805e0fdbf180d221f43be2c4412645484f6983e5"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.9/mailpit-darwin-arm64.tar.gz"
      sha256 "b96ec79cb89f0c029a1c5b7a6f8a87cf0c3115d222cb97424f67aeddbabe6875"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.9/mailpit-linux-386.tar.gz"
      sha256 "6d2beea104ed9c6a12fceb446b681890594456c4adcc839bf9215e48106f244b"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.9/mailpit-linux-amd64.tar.gz"
      sha256 "7c47a27eb20df5f1c586f89f76d7fcf84b6406c70e14f3ec5424c0c84a80ee13"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.9/mailpit-linux-arm.tar.gz"
      sha256 "0d81b02740dde39cfdccf6b205ddad3bc6659b29ac7757761324e4738fc1e217"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.9/mailpit-linux-arm64.tar.gz"
      sha256 "ebaee626520142431392d332276e14ae6fdcc47280be59013088dfd9943d8549"

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
