# © VampSecure Studios — VampSecure Labs Security Research Division
class VampPenreport < Formula
  include Language::Python::Virtualenv

  desc "Penetration test report generator for VampSecure Labs assessments"
  homepage "https://github.com/Vampsecure-Labs/vamp-penreport"
  url "https://files.pythonhosted.org/packages/e2/0f/74fe12bd3e8bbc63da87aa915e4547fdd2dafbbc711f20bd3121d4121e82/vamp_penreport-2.3.tar.gz"
  sha256 "5d7f998e9e671016dd9f06b0572857a0ff8d9e25c95008db6f56e4fb880a3d86"
  license "MIT"
  version "2.3"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-penreport==2.3"
    bin.install_symlink libexec/"bin/vamp-penreport"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-penreport --help 2>&1")
  end
end
