# © VampSecure Studios — VampSecure Labs Security Research Division
class VampJwtAudit < Formula
  include Language::Python::Virtualenv

  desc "JWT security auditor — alg=none, RS256-to-HS256 confusion, HMAC brute force"
  homepage "https://github.com/Vampsecure-Labs/vamp-jwt-audit"
  url "https://files.pythonhosted.org/packages/b4/5b/f0f11095e46a20effd2dc6e6605602625ea694d31ec1333ec181d073b1c9/vamp_jwt_audit-1.3.0.tar.gz"
  sha256 "3af379ddb2f1dd2a4394c4575baffb63f479c745e2d4f61de259ed5384aef804"
  license "MIT"
  version "1.3.0"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-jwt-audit==1.3.0"
    bin.install_symlink libexec/"bin/vamp-jwt-audit"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-jwt-audit --help 2>&1")
  end
end
