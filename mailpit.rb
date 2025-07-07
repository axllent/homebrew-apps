class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.27.1"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.27.1/mailpit-darwin-amd64.tar.gz"
      sha256 "1ebbbd07275b48eb45b402f95392b7bf7f9e97d9cc10fc866698714936f34e9e"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.27.1/mailpit-darwin-arm64.tar.gz"
      sha256 "8d7575635fadb33d7a3d7e9aeb3170a8523f247402c4eb16cf150f76d9581930"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.27.1/mailpit-linux-386.tar.gz"
      sha256 "f1d6e8f1f9f39f56d0c11432efb82dba3dec61bb176e88b04027cb56eef24afb"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.27.1/mailpit-linux-amd64.tar.gz"
      sha256 "ea60c0fce09c12ec868cfef1caf7878773ca840b20bf10c9cc49b51b44f047a7"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.27.1/mailpit-linux-arm.tar.gz"
      sha256 "30f8c6136a399ea6f8062ff5a47cf976ee2f07aea5e3db024373714a287a1e93"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.27.1/mailpit-linux-arm64.tar.gz"
      sha256 "9df9dc967d5866dd4b52e15990a198c5999db6bb4af73db4e55ca032853e3a58"

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
