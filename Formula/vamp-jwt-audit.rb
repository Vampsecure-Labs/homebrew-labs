# © VampSecure Studios — VampSecure Labs Security Research Division
class VampJwtAudit < Formula
  include Language::Python::Virtualenv

  desc "JWT security auditor — alg=none, RS256-to-HS256 confusion, HMAC brute force"
  homepage "https://github.com/Vampsecure-Labs/vamp-jwt-audit"
  url "https://files.pythonhosted.org/packages/bc/48/bfd37710bf08757c049cb067f958b6111a68a6719563b5ffd17e0d766724/vamp_jwt_audit-1.0.1.tar.gz"
  sha256 "78d82b0f30be2e458eb9377f1c3284a173ab443d81eefa2397b8223f0c6d7eff"
  license "MIT"
  version "1.0.1"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-jwt-audit==1.0.1"
    bin.install_symlink libexec/"bin/vamp-jwt-audit"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-jwt-audit --help 2>&1")
  end
end
