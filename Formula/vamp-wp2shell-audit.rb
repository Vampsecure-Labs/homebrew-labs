# © VampSecure Studios — VampSecure Labs Security Research Division
class VampWp2shellAudit < Formula
  include Language::Python::Virtualenv

  desc "WordPress upload-vector and webshell auditor for authorized assessments"
  homepage "https://github.com/Vampsecure-Labs/vamp-wp2shell-audit"
  url "https://files.pythonhosted.org/packages/54/50/290e567c954d584a12b02574c579f5cb5687d9e38ec8cc77cbfac1257748/vamp_wp2shell_audit-1.3.tar.gz"
  sha256 "f5226c6bda7661d0fb9e7c9bec0af667bd7f5f4f773ec99e776e93d7f6f3fb28"
  license "MIT"
  version "1.3"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-wp2shell-audit==1.3"
    bin.install_symlink libexec/"bin/vamp-wp2shell-audit"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-wp2shell-audit --help 2>&1")
  end
end
