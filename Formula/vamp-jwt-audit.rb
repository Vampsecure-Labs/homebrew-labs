# © VampSecure Studios — VampSecure Labs Security Research Division
class VampJwtAudit < Formula
  include Language::Python::Virtualenv

  desc "JWT security auditor — alg=none, RS256-to-HS256 confusion, HMAC brute force"
  homepage "https://github.com/Vampsecure-Labs/vamp-jwt-audit"
  url "https://files.pythonhosted.org/packages/92/c3/084aa8eacd78c6f67c939cf23b4d7c78e00db338841011fb7dfbe5356bf4/vamp_jwt_audit-1.1.0.tar.gz"
  sha256 "ff1b9798c1846fd84ba987f56fdfb902bcfd6f0452034b0288d4cada0713ae38"
  license "MIT"
  version "1.1.0"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-jwt-audit==1.1.0"
    bin.install_symlink libexec/"bin/vamp-jwt-audit"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-jwt-audit --help 2>&1")
  end
end
