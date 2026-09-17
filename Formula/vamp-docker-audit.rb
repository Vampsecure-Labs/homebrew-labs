# © VampSecure Studios — VampSecure Labs Security Research Division
class VampDockerAudit < Formula
  include Language::Python::Virtualenv

  desc "Docker/container security auditor for authorized assessments"
  homepage "https://github.com/Vampsecure-Labs/vamp-docker-audit"
  url "https://files.pythonhosted.org/packages/f6/ed/59a65ea31a2b4c48a58e5aaeb53842c49626e4ad65bbbfad331daaed3795/vamp_docker_audit-1.0.tar.gz"
  sha256 "50e469d20336a64b8739b71baff54a5c241e3908a17d3ab35b6552b2f2a479ac"
  license "MIT"
  version "1.0"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-docker-audit==1.0"
    bin.install_symlink libexec/"bin/vamp-docker-audit"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-docker-audit --help 2>&1")
  end
end
