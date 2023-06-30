class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.7.0"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.7.0/mailpit-darwin-amd64.tar.gz"
      sha256 "dcbebc49715c73dd908cd7e45d6b24ede1255c2760d1735ee360f1e1616aeaf6"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.7.0/mailpit-darwin-arm64.tar.gz"
      sha256 "632311da56c25d3b29c3d4c18a64df4697c428cbd8ad39782eb2ed9fc8446e9c"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.7.0/mailpit-linux-386.tar.gz"
      sha256 "2781002bb17d61d467b4ae0aea7ae7fe49eab8c9db212e27fcbd1d821cc465d5"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.7.0/mailpit-linux-amd64.tar.gz"
      sha256 "0a1ae4a5858217bcd0376111d28780af3392accda7b6de5bb6e01fc8f4f11991"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.7.0/mailpit-linux-arm.tar.gz"
      sha256 "d9615f5fc2635a746f1ed2ac04d1bffd353c2ee77b2ab13da240150fd3e03950"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.7.0/mailpit-linux-arm64.tar.gz"
      sha256 "054af2bb69e367864f0aa2889eb403b101c63512c546274bcbf41cdcb1cb2747"

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
