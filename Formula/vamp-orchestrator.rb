# © VampSecure Studios — VampSecure Labs Security Research Division
class VampOrchestrator < Formula
  include Language::Python::Virtualenv

  desc "VampSecure Labs tool orchestrator for automated authorized security audits"
  homepage "https://github.com/Vampsecure-Labs/vamp-orchestrator"
  url "https://files.pythonhosted.org/packages/98/b8/28b5e2d5141d498f163163cb64c238a8c2b19e905eaecfc076f8db76ccb6/vamp_orchestrator-2.3.tar.gz"
  sha256 "bfae25035a6795cd9def9a20c298a2c7458a4ce8abdaf855a2cfa8fd4193daab"
  license "MIT"
  version "2.3"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-orchestrator==2.3"
    bin.install_symlink libexec/"bin/vamp-orchestrator"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-orchestrator --help 2>&1")
  end
end
