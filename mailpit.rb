class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.7.1"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.7.1/mailpit-darwin-amd64.tar.gz"
      sha256 "bb4ad74107872af30aea719191ef6bad2d9ef10dcf313ac6c70166f0da59aed1"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.7.1/mailpit-darwin-arm64.tar.gz"
      sha256 "fadd82b73ae14e8ac663f5ec1604920eb3808f93a4def60eae198dff47ff5565"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.7.1/mailpit-linux-386.tar.gz"
      sha256 "fdec0a14539829998545674d0ae72e07df62df04b8e16eaf55be8a7cba25f775"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.7.1/mailpit-linux-amd64.tar.gz"
      sha256 "5c85e4f6ec07b7f3fc51517687c95b760b791ee02992fb7757a1f32556f6a486"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.7.1/mailpit-linux-arm.tar.gz"
      sha256 "b17c71eb37596c17e42d8be7cb2e3e0ae4efe986fd0fa36d9cafc5c063aa2568"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.7.1/mailpit-linux-arm64.tar.gz"
      sha256 "5d7e902fa6171ec3adabc9ab99b881061b90f98f0add66150655f5b68d80c3d2"

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
