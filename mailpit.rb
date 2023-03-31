class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.5.0"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.5.0/mailpit-darwin-amd64.tar.gz"
      sha256 "cef21edea0343116df3afc93381a511cae811f9001d4e9543c845eb6777f6234"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.5.0/mailpit-darwin-arm64.tar.gz"
      sha256 "ec74484c77c54ef33dbab2a33e7f74daf8ed69f802c269ce1c3275e4ec3e5bd7"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.5.0/mailpit-linux-386.tar.gz"
      sha256 "aaf3a441f6f0a7be54dc036ef13c3ef3a3f78a7ff0e1ee2d96c83c0e38c20350"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.5.0/mailpit-linux-amd64.tar.gz"
      sha256 "5da681049cbf355faa93b66faf3429f4430695773fbf17486d17c833f796888a"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.5.0/mailpit-linux-arm.tar.gz"
      sha256 "af78063852efbc8cb45d8d138f109affb3a94dbca1b532d5e9df34de4e2f5e99"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.5.0/mailpit-linux-arm64.tar.gz"
      sha256 "f1699994af3228e50d8a5bf8036e9b2cb706e42170d7e29113c63caed29d4b22"

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
