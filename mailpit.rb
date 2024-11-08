class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.21.2"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.21.2/mailpit-darwin-amd64.tar.gz"
      sha256 "1ead10f4098b3348ca20961afbc5755245cabd1be8db3af9f3c04669b91a0aa1"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.21.2/mailpit-darwin-arm64.tar.gz"
      sha256 "80514b3e08d18216e72f0e10271e9ee4a94765423195fc63661dada1f914fb72"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.21.2/mailpit-linux-386.tar.gz"
      sha256 "ee8b7fb17e2467385d15644a947489849f6ca6c0715006289a6c9e3bc40860ca"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.21.2/mailpit-linux-amd64.tar.gz"
      sha256 "f588e6f8571831b7b27692e39778b3f0194c4a2ad2c601c3de2ae45d2375f2c3"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.21.2/mailpit-linux-arm.tar.gz"
      sha256 "cf5351388a7c3616833c943e5706340f360ea6cb8832fce168eecb37143e2f79"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.21.2/mailpit-linux-arm64.tar.gz"
      sha256 "f361c1237bd498644b262b56e663ac20d3b3a7f5b576c8afe269e723c9f2a212"

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
