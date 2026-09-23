# © VampSecure Studios — VampSecure Labs Security Research Division
class VampCloudEnum < Formula
  include Language::Python::Virtualenv

  desc "Cloud asset enumeration and exposure analysis for authorized audits"
  homepage "https://github.com/Vampsecure-Labs/vamp-cloud-enum"
  url "https://files.pythonhosted.org/packages/17/da/598cf5511fe4cfca8bedf74e4a816cb5860d0c5c43989e3b4c8623db5198/vamp_cloud_enum-1.2.tar.gz"
  sha256 "70d625943d8a61176b546dbc3420dde258d395b01315e9bbc9233c5feb127e90"
  license "MIT"
  version "1.2"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-cloud-enum==1.2"
    bin.install_symlink libexec/"bin/vamp-cloud-enum"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-cloud-enum --help 2>&1")
  end
end
