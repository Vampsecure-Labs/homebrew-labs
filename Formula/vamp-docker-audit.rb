# © VampSecure Studios — VampSecure Labs Security Research Division
class VampDockerAudit < Formula
  include Language::Python::Virtualenv

  desc "Docker/container security auditor for authorized assessments"
  homepage "https://github.com/Vampsecure-Labs/vamp-docker-audit"
  url "https://files.pythonhosted.org/packages/source/v/vamp-docker-audit/vamp_docker_audit-1.4.tar.gz"
  sha256 "d108822f4b9555e2efd7a4b407a7dcfd90810f090569c31225e3b9e3a670cd05"
  license "AGPL-3.0-only"
  version "1.4"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-docker-audit==1.4"
    bin.install_symlink libexec/"bin/vamp-docker-audit"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-docker-audit --help 2>&1")
  end
end
