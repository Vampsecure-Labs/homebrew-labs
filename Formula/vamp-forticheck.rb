# © VampSecure Studios — VampSecure Labs Security Research Division
class VampForticheck < Formula
  include Language::Python::Virtualenv

  desc "Multi-vendor network appliance CVE scanner — FortiOS, PAN-OS, Cisco ASA/IOS-XE, Check Point, Juniper"
  homepage "https://github.com/Vampsecure-Labs/vamp-forticheck"
  url "https://files.pythonhosted.org/packages/e7/41/817d8df7f4e7ea4396f21a7ca5ed4e031df7ef4507af66f6d46ec1db9085/vamp_forticheck-1.2.0.tar.gz"
  sha256 "032637a40a5f6347aea9065d012a960c0b6cd74712112420eb06cc52124db975"
  license "MIT"
  version "1.2.0"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-forticheck==1.2.0"
    bin.install_symlink libexec/"bin/vamp-forticheck"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-forticheck --help 2>&1")
  end
end
