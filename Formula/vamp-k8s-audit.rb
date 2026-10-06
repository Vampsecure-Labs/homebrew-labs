# © VampSecure Studios — VampSecure Labs Security Research Division
class VampK8sAudit < Formula
  include Language::Python::Virtualenv

  desc "Kubernetes cluster security auditor for authorized assessments"
  homepage "https://github.com/Vampsecure-Labs/vamp-k8s-audit"
  url "https://files.pythonhosted.org/packages/source/v/vamp-k8s-audit/vamp_k8s_audit-2.2.0.tar.gz"
  sha256 "77214649c57d900760d709ac723d97a860c9c393a001ed820aa6162ab9e32791"
  license "AGPL-3.0-only"
  version "2.2.0"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-k8s-audit==2.2.0"
    bin.install_symlink libexec/"bin/vamp-k8s-audit"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-k8s-audit --help 2>&1")
  end
end
