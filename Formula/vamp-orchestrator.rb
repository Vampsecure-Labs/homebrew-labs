# © VampSecure Studios — VampSecure Labs Security Research Division
class VampOrchestrator < Formula
  include Language::Python::Virtualenv

  desc "VampSecure Labs tool orchestrator for automated authorized security audits"
  homepage "https://github.com/Vampsecure-Labs/vamp-orchestrator"
  url "https://files.pythonhosted.org/packages/98/b8/28b5e2d5141d498f163163cb64c238a8c2b19e905eaecfc076f8db76ccb6/vamp_orchestrator-2.7.tar.gz"
  sha256 "3f1462b5ba5ead6ad6ee7c3e6f90a11ee168052120dfd5c9821104979bb5e147"
  license "MIT"
  version "2.7"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-orchestrator==2.7"
    bin.install_symlink libexec/"bin/vamp-orchestrator"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-orchestrator --help 2>&1")
  end
end
