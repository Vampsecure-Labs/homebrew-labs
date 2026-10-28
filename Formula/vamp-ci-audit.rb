# © VampSecure Studios — VampSecure Labs Security Research Division
class VampCiAudit < Formula
  include Language::Python::Virtualenv

  desc "CI/CD pipeline security auditor: GitHub Actions, GitLab CI and Forgejo Actions"
  homepage "https://github.com/Vampsecure-Labs/vamp-ci-audit"
  url "https://files.pythonhosted.org/packages/f9/17/87c3f2da105a3e74daa9e169d870e43fee3c8fcc70b73fc29aba7382ac6b/vamp_ci_audit-1.3.tar.gz"
  sha256 "58cc8d65a7f8b27fc6a4dfc93fb9ae12bfb16dabd4a30fa523610c5450cd388e"
  license "AGPL-3.0-only"
  version "1.3"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-ci-audit==1.3"
    bin.install_symlink libexec/"bin/vamp-ci-audit"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-ci-audit --help 2>&1")
  end
end
