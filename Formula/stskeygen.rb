# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Stskeygen < Formula
  desc "A commandline utility for trading directory service credentials (such as AD username and password) for AWS STS Keys."
  homepage "https://cimpress-support.atlassian.net/wiki/spaces/CloudKB/pages/15058567646/Generating+STS+access+keys+via+Auth0"
  version "2.5.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://ce-installation-binaries.s3.us-east-1.amazonaws.com/stskeygen/2.5.2/stskeygen_2.5.2_darwin_arm64.tar.gz"
      sha256 "3c2baa41504622b1b84203b92c5f86aa18050091dd369a792fbfdf8e4e049b9b"

      def install
        bin.install "stskeygen"
      end
    end
    if Hardware::CPU.intel?
      url "https://ce-installation-binaries.s3.us-east-1.amazonaws.com/stskeygen/2.5.2/stskeygen_2.5.2_darwin_amd64.tar.gz"
      sha256 "b6818d256c9c0aab35f988ffb6160ba81e5e72fc603df0253fff260ad31bbf6f"

      def install
        bin.install "stskeygen"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://ce-installation-binaries.s3.us-east-1.amazonaws.com/stskeygen/2.5.2/stskeygen_2.5.2_linux_arm64.tar.gz"
      sha256 "ae14344e5060480c2b8ab2060df88b2913374de326f96aa47a8a9987e6ebaf7a"

      def install
        bin.install "stskeygen"
      end
    end
    if Hardware::CPU.intel?
      url "https://ce-installation-binaries.s3.us-east-1.amazonaws.com/stskeygen/2.5.2/stskeygen_2.5.2_linux_amd64.tar.gz"
      sha256 "72f234517f90e38629ca8c6b1a51364f39aaaa7919eeafaf1fd431e7f3ea170b"

      def install
        bin.install "stskeygen"
      end
    end
  end

  test do
    system "#{bin}/stskeygen"
  end
end
