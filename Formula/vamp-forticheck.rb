# © VampSecure Studios — VampSecure Labs Security Research Division
class VampForticheck < Formula
  include Language::Python::Virtualenv

  desc "Multi-vendor network appliance CVE scanner — FortiOS, PAN-OS, Cisco ASA/IOS-XE, Check Point, Juniper"
  homepage "https://github.com/Vampsecure-Labs/vamp-forticheck"
  url "https://files.pythonhosted.org/packages/e7/41/817d8df7f4e7ea4396f21a7ca5ed4e031df7ef4507af66f6d46ec1db9085/vamp_forticheck-1.3.0.tar.gz"
  sha256 "3f21a8d961685d45fc9aab94c1b6ece377f62ac23d057f2a1d6cc0ae7f2da9ed"
  license "MIT"
  version "1.3.0"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-forticheck==1.3.0"
    bin.install_symlink libexec/"bin/vamp-forticheck"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-forticheck --help 2>&1")
  end
end
