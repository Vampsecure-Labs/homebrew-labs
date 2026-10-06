# © VampSecure Studios — VampSecure Labs Security Research Division
class VampWafBypass < Formula
  include Language::Python::Virtualenv

  desc "WAF evasion tester — 15 bypass techniques for authorized security testing"
  homepage "https://github.com/Vampsecure-Labs/vamp-waf-bypass"
  url "https://files.pythonhosted.org/packages/source/v/vamp-waf-bypass/vamp_waf_bypass-1.0.0.tar.gz"
  sha256 "da8d4828a3f15d649faadad014879bf68b51c1814bcf7a3d8cbb0017d3d975ba"
  license "AGPL-3.0-only"
  version "1.0.0"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-waf-bypass==1.0.0"
    bin.install_symlink libexec/"bin/vamp-waf-bypass"
  end

  test do
    assert_match "vamp-waf-bypass", shell_output("#{bin}/vamp-waf-bypass --help 2>&1")
  end
end
