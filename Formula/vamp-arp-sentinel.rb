# © VampSecure Studios — VampSecure Labs Security Research Division
class VampArpSentinel < Formula
  include Language::Python::Virtualenv

  desc "ARP monitoring and rogue-device detection for authorized network audits"
  homepage "https://github.com/Vampsecure-Labs/vamp-arp-sentinel"
  url "https://files.pythonhosted.org/packages/4d/7b/eb61b97d4982c45b5b3b5d1ab5571bbdf5dc98c424a9033e0656d6fe80ed/vamp_arp_sentinel-2.2.tar.gz"
  sha256 "4faddfda08a044ade3edd1820d0103477c461e2cea467f1a1128f02a4101b7ca"
  license "MIT"
  version "2.2"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-arp-sentinel==2.2"
    bin.install_symlink libexec/"bin/vamp-arp-sentinel"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-arp-sentinel --help 2>&1")
  end
end
