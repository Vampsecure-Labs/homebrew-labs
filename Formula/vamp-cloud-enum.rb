# © VampSecure Studios — VampSecure Labs Security Research Division
class VampCloudEnum < Formula
  include Language::Python::Virtualenv

  desc "Cloud asset enumeration and exposure analysis for authorized audits"
  homepage "https://github.com/Vampsecure-Labs/vamp-cloud-enum"
  url "https://files.pythonhosted.org/packages/4a/94/306d6b27784b8948710c3542c9c9f88938169495737cee1c420a7bc1c753/vamp_cloud_enum-1.3.tar.gz"
  sha256 "599b8d5aad808f88d6687b91ccf6f2316091487bbd1ced01e146040cb59672b7"
  license "MIT"
  version "1.3"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-cloud-enum==1.3"
    bin.install_symlink libexec/"bin/vamp-cloud-enum"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-cloud-enum --help 2>&1")
  end
end
