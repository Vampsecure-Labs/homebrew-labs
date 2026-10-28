# © VampSecure Studios — VampSecure Labs Security Research Division
class VampIacAudit < Formula
  include Language::Python::Virtualenv

  desc "Infrastructure-as-Code security auditor: Terraform, CloudFormation and Helm static analysis"
  homepage "https://github.com/Vampsecure-Labs/vamp-iac-audit"
  url "https://files.pythonhosted.org/packages/08/d2/4529f741137714931c91ad216930a66041edb456f75093443fd9b57ed374/vamp_iac_audit-2.7.2.tar.gz"
  sha256 "d4dc950d4710507f8d0489d7adf55d46a3c11160fa4035411e087189a27601f7"
  license "AGPL-3.0-only"
  version "2.7.2"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-iac-audit==2.7.2"
    bin.install_symlink libexec/"bin/vamp-iac-audit"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-iac-audit --help 2>&1")
  end
end
