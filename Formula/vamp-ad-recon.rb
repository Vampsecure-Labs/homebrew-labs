# © VampSecure Studios — VampSecure Labs Security Research Division
class VampAdRecon < Formula
  include Language::Python::Virtualenv

  desc "Active Directory security auditor: Kerberoasting, AS-REP Roasting, delegation misconfigurations"
  homepage "https://github.com/Vampsecure-Labs/vamp-ad-recon"
  url "https://files.pythonhosted.org/packages/source/v/vamp-ad-recon/vamp_ad_recon-1.0.tar.gz"
  sha256 "4bf53676aea0fbedb839b337be55d301e189ff1ad87046d4bc4289e31be09f75"
  license "AGPL-3.0-only"
  version "1.0"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-ad-recon==1.0"
    bin.install_symlink libexec/"bin/vamp-ad-recon"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-ad-recon --help 2>&1")
  end
end
