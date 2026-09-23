# © VampSecure Studios — VampSecure Labs Security Research Division
class VampSslAudit < Formula
  include Language::Python::Virtualenv

  desc "TLS/SSL security auditor — protocol version, cipher suites, certificate validity, HSTS preload"
  homepage "https://github.com/Vampsecure-Labs/vamp-ssl-audit"
  url "https://files.pythonhosted.org/packages/19/7e/6f6bcfb59d6042c286278439313c0edf2f44830be323350fba097d48abf4/vamp_ssl_audit-1.4.0.tar.gz"
  sha256 "678ad574ebafe90f2ad6b728b714eb31670eb0eee2638714baf2c7e5ef22e736"
  license "MIT"
  version "1.4.0"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-ssl-audit==1.4.0"
    bin.install_symlink libexec/"bin/vamp-ssl-audit"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-ssl-audit --help 2>&1")
  end
end
