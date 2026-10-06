# © VampSecure Studios — VampSecure Labs Security Research Division
class VampWafBypass < Formula
  include Language::Python::Virtualenv

  desc "WAF evasion tester — 15 bypass techniques for authorized security testing"
  homepage "https://github.com/Vampsecure-Labs/vamp-waf-bypass"
  url "https://files.pythonhosted.org/packages/source/v/vamp-waf-bypass/vamp_waf_bypass-1.1.0.tar.gz"
  sha256 "862c7dbb27c7beb287dda2f221da8dd2bf7d5a3c32089b7cefbab73b0f816c34"
  license "AGPL-3.0-only"
  version "1.1.0"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-waf-bypass==1.1.0"
    bin.install_symlink libexec/"bin/vamp-waf-bypass"
  end

  test do
    assert_match "vamp-waf-bypass", shell_output("#{bin}/vamp-waf-bypass --help 2>&1")
  end
end
