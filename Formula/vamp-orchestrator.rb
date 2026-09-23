# © VampSecure Studios — VampSecure Labs Security Research Division
class VampOrchestrator < Formula
  include Language::Python::Virtualenv

  desc "VampSecure Labs tool orchestrator for automated authorized security audits"
  homepage "https://github.com/Vampsecure-Labs/vamp-orchestrator"
  url "https://files.pythonhosted.org/packages/0c/cf/5012165e4b056bc4d22ae652842127b5fbdb7013b860f2370fa137d3b006/vamp_orchestrator-2.2.tar.gz"
  sha256 "f2253813bea2c1da3b25c16becca47a7b4c3f281fc3e9abb26c70f680937ba4c"
  license "MIT"
  version "2.2"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-orchestrator==2.2"
    bin.install_symlink libexec/"bin/vamp-orchestrator"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-orchestrator --help 2>&1")
  end
end
