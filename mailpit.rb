class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.20.4"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.20.4/mailpit-darwin-amd64.tar.gz"
      sha256 "34ebc44bec2a456b924cdf08ed787505a35a8a449010a2b2c5ac88c182b65e9a"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.20.4/mailpit-darwin-arm64.tar.gz"
      sha256 "760e360d61000ab28a7c8b125abff30411993bdb03b3974ab1c1edab2de5c251"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.20.4/mailpit-linux-386.tar.gz"
      sha256 "609d1fd936fe2238ee2e9008860f231476f3b141cbdc070c0c30898d27d355fd"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.20.4/mailpit-linux-amd64.tar.gz"
      sha256 "fa9ff7a207c4575ed504b4061debedca25e5f6dd48947405ea117f13f233b8fc"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.20.4/mailpit-linux-arm.tar.gz"
      sha256 "0f754e0f46156cb52b86ff8553cc2b17f21d65064e157ef0a949f856b83888f5"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.20.4/mailpit-linux-arm64.tar.gz"
      sha256 "dee8e665cf682c013e469101fa83e712a88b59b49ae3b1b7d060a27acc329506"

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
