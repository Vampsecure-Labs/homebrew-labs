# © VampSecure Studios — VampSecure Labs Security Research Division
class VampArpSentinel < Formula
  include Language::Python::Virtualenv

  desc "ARP monitoring and rogue-device detection for authorized network audits"
  homepage "https://github.com/Vampsecure-Labs/vamp-arp-sentinel"
  url "https://files.pythonhosted.org/packages/47/76/a446bba5b299aeb197ddb0bd2cff0a3e221553170966b20020d9b5948950/vamp_arp_sentinel-2.0.tar.gz"
  sha256 "53d32904b5912e2f0bcfd05a734989241a1f75b187bbe1db2040e9a6df14ed7a"
  license "MIT"
  version "2.0"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-arp-sentinel==2.0"
    bin.install_symlink libexec/"bin/vamp-arp-sentinel"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-arp-sentinel --help 2>&1")
  end
end
