# © VampSecure Studios — VampSecure Labs Security Research Division
class VampAdRecon < Formula
  include Language::Python::Virtualenv

  desc "Active Directory security auditor: Kerberoasting, AS-REP Roasting, delegation misconfigurations"
  homepage "https://github.com/Vampsecure-Labs/vamp-ad-recon"
  url "https://files.pythonhosted.org/packages/9b/02/09b18169d455f86dd98135abcf1791a563f212879332e5cfef3443ae6800/vamp_ad_recon-1.4.tar.gz"
  sha256 "6775795573c671a9900129a1f598e0a65962a04ed905fa66408b5ee1ade9dec0"
  license "AGPL-3.0-only"
  version "1.4"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-ad-recon==1.4"
    bin.install_symlink libexec/"bin/vamp-ad-recon"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-ad-recon --help 2>&1")
  end
end
