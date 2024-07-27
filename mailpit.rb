class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.19.3"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.19.3/mailpit-darwin-amd64.tar.gz"
      sha256 "c17799f39f504107e5cbb82ffdedbd00d3830a09641ce07a5afcc6f54f2e3d76"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.19.3/mailpit-darwin-arm64.tar.gz"
      sha256 "333c85514a89e81740cd8724cb605b1c2fd66594187d89bc7c92b1a553428f6e"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.19.3/mailpit-linux-386.tar.gz"
      sha256 "96d46c87384a7e52363276ae851babc9246bb74d34c8b98c3e102607e8992390"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.19.3/mailpit-linux-amd64.tar.gz"
      sha256 "dad9502f2ab36b4ec8c06e235d10357c666b656a246cbf66c525532554f56d14"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.19.3/mailpit-linux-arm.tar.gz"
      sha256 "a6371b1b7dbcacc7dd19d81bcb1d4f2d3f74e6aebe2b6cec95fab7bb093b246e"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.19.3/mailpit-linux-arm64.tar.gz"
      sha256 "ee7a10e125d976634c6e3d906b6d4e41c1fd48bb8a3783b88bfa2c6cd71afa8d"

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
