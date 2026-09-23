# © VampSecure Studios — VampSecure Labs Security Research Division
class VampOrchestrator < Formula
  include Language::Python::Virtualenv

  desc "VampSecure Labs tool orchestrator for automated authorized security audits"
  homepage "https://github.com/Vampsecure-Labs/vamp-orchestrator"
  url "https://files.pythonhosted.org/packages/5b/f3/74358aa21b74b1f77020d2ed71a820cb223695697f0d48ddbbe1eebf25f3/vamp_orchestrator-2.1.tar.gz"
  sha256 "48a726b53b135559221ecf14166cc17b9a34c0f063443b8bda2021584aec8516"
  license "MIT"
  version "2.1"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-orchestrator==2.1"
    bin.install_symlink libexec/"bin/vamp-orchestrator"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-orchestrator --help 2>&1")
  end
end
