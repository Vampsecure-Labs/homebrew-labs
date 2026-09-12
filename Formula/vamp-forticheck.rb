# © VampSecure Studios — VampSecure Labs Security Research Division
class VampForticheck < Formula
  include Language::Python::Virtualenv

  desc "Multi-vendor network appliance CVE scanner — FortiOS, PAN-OS, Cisco ASA/IOS-XE, Check Point, Juniper"
  homepage "https://github.com/Vampsecure-Labs/vamp-forticheck"
  url "https://files.pythonhosted.org/packages/ee/02/e73a20be6818a24935b31bbfd00fdc2f49998805fdb6a512899528cbf362/vamp_forticheck-1.0.0.tar.gz"
  sha256 "424becf27813e221eb34cfff8ea65cb84a12c4a59138b19444fdc805fa554181"
  license "MIT"
  version "1.0.0"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-forticheck==1.0.0"
    bin.install_symlink libexec/"bin/vamp-forticheck"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-forticheck --help 2>&1")
  end
end
