# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Stskeygen < Formula
  desc "A commandline utility for trading directory service credentials (such as AD username and password) for AWS STS Keys."
  homepage "https://support.cimpress.cloud/hc/en-us/articles/227873908"
  version "2.2.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://ce-installation-binaries.s3.us-east-1.amazonaws.com/stskeygen/2.2.5/stskeygen_2.2.5_Darwin_arm64.tar.gz"
      sha256 "0aa89650157a8badfddfb15f4586514ab3d701e94cd970d4139a151464e23da0"

      def install
        bin.install "stskeygen"
      end
    end
    if Hardware::CPU.intel?
      url "https://ce-installation-binaries.s3.us-east-1.amazonaws.com/stskeygen/2.2.5/stskeygen_2.2.5_Darwin_x86_64.tar.gz"
      sha256 "4757710b0ee8839ed8296e69c990fb92ee4ab40fd09a9680a08c9a54c2705081"

      def install
        bin.install "stskeygen"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://ce-installation-binaries.s3.us-east-1.amazonaws.com/stskeygen/2.2.5/stskeygen_2.2.5_Linux_arm64.tar.gz"
      sha256 "af27531d4bf46d9b738147df646ab194528916581ed22fb61dea9590a14f748d"

      def install
        bin.install "stskeygen"
      end
    end
    if Hardware::CPU.intel?
      url "https://ce-installation-binaries.s3.us-east-1.amazonaws.com/stskeygen/2.2.5/stskeygen_2.2.5_Linux_x86_64.tar.gz"
      sha256 "21ae29f8402163f1b13e649e68a29c112869b5447704c628647a7eb0de1fd863"

      def install
        bin.install "stskeygen"
      end
    end
  end

  test do
    system "#{bin}/stskeygen"
  end
end
