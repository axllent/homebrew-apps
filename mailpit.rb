class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.18.0"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.18.0/mailpit-darwin-amd64.tar.gz"
      sha256 "d343ac56962dbb5b5d1ff9dd63d7a470cfac91b5134791c380f1152773dae84d"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.18.0/mailpit-darwin-arm64.tar.gz"
      sha256 "bfe9bccc79e0e22793aae60c13b968071349a556492305cb176e4094e10874c1"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.18.0/mailpit-linux-386.tar.gz"
      sha256 "0a69163336c1277b360cd60f04ceed62d5a83ba345338b73cde054797551989a"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.18.0/mailpit-linux-amd64.tar.gz"
      sha256 "71776307f8198302b585671094f942b134030ae15b734e7973e7420a81ddece5"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.18.0/mailpit-linux-arm.tar.gz"
      sha256 "b2cd90366b8b4528df8b41c3950ccf786414cc9648180f393ee1de408536bb68"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.18.0/mailpit-linux-arm64.tar.gz"
      sha256 "7269b80aefa52e5ff7e68e66a13f7cae65ce7c99b2e9e2a382e86bf13d036341"

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
