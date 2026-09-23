# © VampSecure Studios — VampSecure Labs Security Research Division
class VampK8sAudit < Formula
  include Language::Python::Virtualenv

  desc "Kubernetes cluster security auditor for authorized assessments"
  homepage "https://github.com/Vampsecure-Labs/vamp-k8s-audit"
  url "https://files.pythonhosted.org/packages/46/f5/1825cf8880020ab622b6cdab382365844567dd58459fc52f373f8b9f2906/vamp_k8s_audit-1.3.tar.gz"
  sha256 "65f2f11bb8b8514cf78a0b2a23fd120f333033f4c1bea5181ab878f8e52bf9bf"
  license "MIT"
  version "1.3"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-k8s-audit==1.3"
    bin.install_symlink libexec/"bin/vamp-k8s-audit"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-k8s-audit --help 2>&1")
  end
end
