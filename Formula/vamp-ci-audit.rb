# © VampSecure Studios — VampSecure Labs Security Research Division
class VampCiAudit < Formula
  include Language::Python::Virtualenv

  desc "CI/CD pipeline security auditor: GitHub Actions, GitLab CI and Forgejo Actions"
  homepage "https://github.com/Vampsecure-Labs/vamp-ci-audit"
  url "https://files.pythonhosted.org/packages/f9/17/87c3f2da105a3e74daa9e169d870e43fee3c8fcc70b73fc29aba7382ac6b/vamp_ci_audit-1.0.tar.gz"
  sha256 "63dbcb852459e9c363cca761e8a5ed47e11a5b9c3267ebce909c9b40513b3628"
  license "AGPL-3.0-only"
  version "1.0"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-ci-audit==1.0"
    bin.install_symlink libexec/"bin/vamp-ci-audit"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-ci-audit --help 2>&1")
  end
end
