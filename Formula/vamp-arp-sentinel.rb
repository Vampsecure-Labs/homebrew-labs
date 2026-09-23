# © VampSecure Studios — VampSecure Labs Security Research Division
class VampArpSentinel < Formula
  include Language::Python::Virtualenv

  desc "ARP monitoring and rogue-device detection for authorized network audits"
  homepage "https://github.com/Vampsecure-Labs/vamp-arp-sentinel"
  url "https://files.pythonhosted.org/packages/23/06/0b82500bf1c0f2dbc6c5dfc52a6c6e2fce67deef884f3b99bb972d370165/vamp_arp_sentinel-2.1.tar.gz"
  sha256 "b0c24d3677561979c8342f752a397cd0bff01e651e306e95cf2af0fa73654f4f"
  license "MIT"
  version "2.1"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-arp-sentinel==2.1"
    bin.install_symlink libexec/"bin/vamp-arp-sentinel"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-arp-sentinel --help 2>&1")
  end
end
