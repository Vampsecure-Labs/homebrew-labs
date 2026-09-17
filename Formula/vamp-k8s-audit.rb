# © VampSecure Studios — VampSecure Labs Security Research Division
class VampK8sAudit < Formula
  include Language::Python::Virtualenv

  desc "Kubernetes cluster security auditor for authorized assessments"
  homepage "https://github.com/Vampsecure-Labs/vamp-k8s-audit"
  url "https://files.pythonhosted.org/packages/b5/89/c602691a361a38b6adc53c5d96d31026d80b398e052d6d3b0b4b3d9cb60d/vamp_k8s_audit-1.0.post1.tar.gz"
  sha256 "33d7904b236fe3d87cd92740586683b5d5d04842707ddda70faaa0d4a3157a55"
  license "MIT"
  version "1.0"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-k8s-audit==1.0.post1"
    bin.install_symlink libexec/"bin/vamp-k8s-audit"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-k8s-audit --help 2>&1")
  end
end
