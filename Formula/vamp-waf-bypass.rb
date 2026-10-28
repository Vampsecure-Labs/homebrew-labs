# © VampSecure Studios — VampSecure Labs Security Research Division
class VampWafBypass < Formula
  include Language::Python::Virtualenv

  desc "WAF evasion tester — 15 bypass techniques for authorized security testing"
  homepage "https://github.com/Vampsecure-Labs/vamp-waf-bypass"
  url "https://files.pythonhosted.org/packages/source/v/vamp-waf-bypass/vamp_waf_bypass-1.2.1.tar.gz"
  sha256 "e1f74310b7325fd923d26ed616c498e6ceb28f21e974deef4e0f774b048cf91c"
  license "AGPL-3.0-only"
  version "1.2.1"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-waf-bypass==1.2.1"
    bin.install_symlink libexec/"bin/vamp-waf-bypass"
  end

  test do
    assert_match "vamp-waf-bypass", shell_output("#{bin}/vamp-waf-bypass --help 2>&1")
  end
end
