class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.14.3"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.14.3/mailpit-darwin-amd64.tar.gz"
      sha256 "a0eaff215d37814787eca7c197059d106756d99b0c854a74ac578c02c2af43dc"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.14.3/mailpit-darwin-arm64.tar.gz"
      sha256 "de7290634289165ce200b72ac9c31ebe27bf1dacb33889a6fca138992a2eee6b"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.14.3/mailpit-linux-386.tar.gz"
      sha256 "a24ec325fdebd115d02bd89a638a3c5066f9ad18a9106abc9e629d382f36a67f"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.14.3/mailpit-linux-amd64.tar.gz"
      sha256 "3be32b940ac4c2a644cb38746ae14360dce5fcb96301e9f962aae4f709546d43"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.14.3/mailpit-linux-arm.tar.gz"
      sha256 "0caa14195bcbd832e603046ee266a057a41345a1dca307216c47d71e70dddbc4"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.14.3/mailpit-linux-arm64.tar.gz"
      sha256 "8260bb5fab7254f50220d56c831046043e5b40e342c5037b546a9019cc31d02a"

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
