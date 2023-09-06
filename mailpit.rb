class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.8.3"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.8.3/mailpit-darwin-amd64.tar.gz"
      sha256 "10faf5388e377bb8991a822c720d0d8eb50bdac7c6bc2875ad222a598832f067"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.8.3/mailpit-darwin-arm64.tar.gz"
      sha256 "ad64f59f87e85cb3c56dc9eed665b670ccf7923f4e5767af711a0d8d55abd9f7"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.8.3/mailpit-linux-386.tar.gz"
      sha256 "b837a9b93522dc65fe468f58d2306de5af504a64bbc2f1a736e479ee5e17deac"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.8.3/mailpit-linux-amd64.tar.gz"
      sha256 "66b4894c593763d0a681b726d749345006f035bb2f31aaa68999596559ad152e"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.8.3/mailpit-linux-arm.tar.gz"
      sha256 "b311edfbc64e745fb6e0b4ee06b1236b3250367de0797afed2087c2052ec0501"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.8.3/mailpit-linux-arm64.tar.gz"
      sha256 "1398ba9b91fb0fb1a915980aca6cc2466a39ad48e0081e88a7fb145d507992f9"

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
