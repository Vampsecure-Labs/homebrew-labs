# © VampSecure Studios — VampSecure Labs Security Research Division
class VampJwtAudit < Formula
  include Language::Python::Virtualenv

  desc "JWT security auditor — alg=none, RS256-to-HS256 confusion, HMAC brute force"
  homepage "https://github.com/Vampsecure-Labs/vamp-jwt-audit"
  url "https://files.pythonhosted.org/packages/source/v/vamp-jwt-audit/vamp_jwt_audit-1.5.0.tar.gz"
  sha256 "2d5d80f22f7e8b15b2ab3a8875d2ec92da234d21f365e5084f918acafe0d774f"
  license "AGPL-3.0-only"
  version "1.5.0"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-jwt-audit==1.5.0"
    bin.install_symlink libexec/"bin/vamp-jwt-audit"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-jwt-audit --help 2>&1")
  end
end
