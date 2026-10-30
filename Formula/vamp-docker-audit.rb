# © VampSecure Studios — VampSecure Labs Security Research Division
class VampDockerAudit < Formula
  include Language::Python::Virtualenv

  desc "Docker/container security auditor for authorized assessments"
  homepage "https://github.com/Vampsecure-Labs/vamp-docker-audit"
  url "https://files.pythonhosted.org/packages/source/v/vamp-docker-audit/vamp_docker_audit-1.6.0.tar.gz"
  sha256 "6f1ae1ee0a218a55175e4197b66bdd8361e436f5eac1fde8e1b39b3931eb54df"
  license "AGPL-3.0-only"
  version "1.6.0"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-docker-audit==1.6.0"
    bin.install_symlink libexec/"bin/vamp-docker-audit"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-docker-audit --help 2>&1")
  end
end
