# © VampSecure Studios — VampSecure Labs Security Research Division
class VampCloudEnum < Formula
  include Language::Python::Virtualenv

  desc "Cloud asset enumeration and exposure analysis for authorized audits"
  homepage "https://github.com/Vampsecure-Labs/vamp-cloud-enum"
  url "https://files.pythonhosted.org/packages/bd/7a/d83856d464e9de8117b6a13530c9c142bed54d6dbb76ecc7980234209ea4/vamp_cloud_enum-1.1.tar.gz"
  sha256 "f00fc8f3a70594dc7d5188ee1ebbd678beff7792780c437d2bbd5e2fc1f222b3"
  license "MIT"
  version "1.1"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-cloud-enum==1.1"
    bin.install_symlink libexec/"bin/vamp-cloud-enum"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-cloud-enum --help 2>&1")
  end
end
