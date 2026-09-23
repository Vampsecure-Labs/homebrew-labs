# © VampSecure Studios — VampSecure Labs Security Research Division
class VampForticheck < Formula
  include Language::Python::Virtualenv

  desc "Multi-vendor network appliance CVE scanner — FortiOS, PAN-OS, Cisco ASA/IOS-XE, Check Point, Juniper"
  homepage "https://github.com/Vampsecure-Labs/vamp-forticheck"
  url "https://files.pythonhosted.org/packages/81/6e/6767780f1a5bb9fbbccdff33760ed858875b207c488767e8a1ee3caeefc8/vamp_forticheck-1.1.0.tar.gz"
  sha256 "1d946e7cbe50b92dea6732881360a9598377360d2016b27a801f4a7c15dfe633"
  license "MIT"
  version "1.1.0"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-forticheck==1.1.0"
    bin.install_symlink libexec/"bin/vamp-forticheck"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-forticheck --help 2>&1")
  end
end
