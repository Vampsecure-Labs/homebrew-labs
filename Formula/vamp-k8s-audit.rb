# © VampSecure Studios — VampSecure Labs Security Research Division
class VampK8sAudit < Formula
  include Language::Python::Virtualenv

  desc "Kubernetes cluster security auditor for authorized assessments"
  homepage "https://github.com/Vampsecure-Labs/vamp-k8s-audit"
  url "https://files.pythonhosted.org/packages/source/v/vamp-k8s-audit/vamp_k8s_audit-3.2.0.tar.gz"
  sha256 "edb26f98fb07e14f00310392b1ebfbe5a2eb349d75089ef3ade31401707aabc6"
  license "AGPL-3.0-only"
  version "3.2.0"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-k8s-audit==3.2.0"
    bin.install_symlink libexec/"bin/vamp-k8s-audit"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-k8s-audit --help 2>&1")
  end
end
