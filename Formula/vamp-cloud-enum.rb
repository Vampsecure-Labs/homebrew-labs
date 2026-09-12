# © VampSecure Studios — VampSecure Labs Security Research Division
class VampCloudEnum < Formula
  include Language::Python::Virtualenv

  desc "Cloud asset enumeration and exposure analysis for authorized audits"
  homepage "https://github.com/Vampsecure-Labs/vamp-cloud-enum"
  url "https://files.pythonhosted.org/packages/f1/d0/9f617ba1434541769b4820a00330b48431cc28954c3141a2699ae5413b71/vamp_cloud_enum-1.0.tar.gz"
  sha256 "56a553bbe9ada82b837524ea7153741a45caa2ec6654622d31531f0bcd3d9d7c"
  license "MIT"
  version "1.0"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-cloud-enum==1.0"
    bin.install_symlink libexec/"bin/vamp-cloud-enum"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-cloud-enum --help 2>&1")
  end
end
