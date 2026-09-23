# © VampSecure Studios — VampSecure Labs Security Research Division
class VampSslAudit < Formula
  include Language::Python::Virtualenv

  desc "TLS/SSL security auditor — protocol version, cipher suites, certificate validity, HSTS preload"
  homepage "https://github.com/Vampsecure-Labs/vamp-ssl-audit"
  url "https://files.pythonhosted.org/packages/66/56/974f86bbfe385111200be7471687cd55edb93c6359f3a879bafa1384895b/vamp_ssl_audit-1.3.0.tar.gz"
  sha256 "0610e53be4bc5bd1057fafea066f23cd4c519cf7d96b1549011963e39c9b1b2c"
  license "MIT"
  version "1.3.0"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-ssl-audit==1.3.0"
    bin.install_symlink libexec/"bin/vamp-ssl-audit"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-ssl-audit --help 2>&1")
  end
end
