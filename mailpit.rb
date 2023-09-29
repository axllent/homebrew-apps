class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.9.4"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.9.4/mailpit-darwin-amd64.tar.gz"
      sha256 "198a25aac7e3cb272ea219d8ef9ab5fa3541a600273f2832cf3f80a4e9bccd89"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.9.4/mailpit-darwin-arm64.tar.gz"
      sha256 "ab1475a9528bca46546156e8caec3105160e135b585168c2f804645f6c09c6b1"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.9.4/mailpit-linux-386.tar.gz"
      sha256 "88bab31d7cd8eab0d9e267ea5772fa10a61ff8889052097cb63672a84a52374d"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.9.4/mailpit-linux-amd64.tar.gz"
      sha256 "fa7544ddda690705be99fd4605efedda3845a655d8881f7c66fe320c8ed61d08"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.9.4/mailpit-linux-arm.tar.gz"
      sha256 "dd975f13b460e475c6b857ba523a0b8c7f2842d0c24a5c55a95be6e29caa1c58"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.9.4/mailpit-linux-arm64.tar.gz"
      sha256 "a9e2ff677246200c14460581367f35546acc8b8d4263f1b85755a5e0d9a98187"

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
