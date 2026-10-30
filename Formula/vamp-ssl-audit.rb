# © VampSecure Studios — VampSecure Labs Security Research Division
class VampSslAudit < Formula
  include Language::Python::Virtualenv

  desc "TLS/SSL security auditor — protocol version, cipher suites, certificate validity, HSTS preload"
  homepage "https://github.com/Vampsecure-Labs/vamp-ssl-audit"
  url "https://files.pythonhosted.org/packages/source/v/vamp-ssl-audit/vamp_ssl_audit-1.8.0.tar.gz"
  sha256 "7658f36252fb8783db6dae6fdd85dfbbf4417daf2dc65856cd44099621879261"
  license "AGPL-3.0-only"
  version "1.8.0"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-ssl-audit==1.8.0"
    bin.install_symlink libexec/"bin/vamp-ssl-audit"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-ssl-audit --help 2>&1")
  end
end
