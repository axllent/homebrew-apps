class Mailpit < Formula
  desc "An email and SMTP testing tool with API for developers"
  homepage "https://github.com/axllent/mailpit"
  license "MIT"
  version "v1.6.8"

  on_macos do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.8/mailpit-darwin-amd64.tar.gz"
      sha256 "f5fc6a0f94cabca29535177f87e6748eb0ce1af73fb9b9fd55403160ce7648fd"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.8/mailpit-darwin-arm64.tar.gz"
      sha256 "ecabb3d01917832bfe63f30b549df497098ce6209cb016b81b705a2c11f2f8c4"

      def install
        bin.install "mailpit"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.8/mailpit-linux-386.tar.gz"
      sha256 "a9a8cfd7ecb86c382a29f79744c7c128ade18acf89471614c2e46490deea1cd2"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.8/mailpit-linux-amd64.tar.gz"
      sha256 "444848134076ca7362f5b7e1afbdd0759cd19b9527181890117670d940cbb1d4"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_32_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.8/mailpit-linux-arm.tar.gz"
      sha256 "933e4803e9f43bc9843d71b7d6f7f5fabd59ccf55c07a5c4870168aa5b0547fb"

      def install
        bin.install "mailpit"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/axllent/mailpit/releases/download/v1.6.8/mailpit-linux-arm64.tar.gz"
      sha256 "197826c3be0bf6f9d4dac97549b10ba61090d5729c0b37ce91a4248464c853ab"

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
