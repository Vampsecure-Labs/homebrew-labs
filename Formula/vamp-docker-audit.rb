# © VampSecure Studios — VampSecure Labs Security Research Division
class VampDockerAudit < Formula
  include Language::Python::Virtualenv

  desc "Docker/container security auditor for authorized assessments"
  homepage "https://github.com/Vampsecure-Labs/vamp-docker-audit"
  url "https://files.pythonhosted.org/packages/17/1c/7f42adb37f6801ba870dec644f2b38db0503335130ac2896739592772e51/vamp_docker_audit-1.3.tar.gz"
  sha256 "a1571bb77225e54776b7e9214072cb27c85de83691c784e7bcabfe626f612a06"
  license "MIT"
  version "1.3"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-docker-audit==1.3"
    bin.install_symlink libexec/"bin/vamp-docker-audit"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-docker-audit --help 2>&1")
  end
end
