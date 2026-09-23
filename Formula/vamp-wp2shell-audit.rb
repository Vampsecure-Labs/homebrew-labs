# © VampSecure Studios — VampSecure Labs Security Research Division
class VampWp2shellAudit < Formula
  include Language::Python::Virtualenv

  desc "WordPress upload-vector and webshell auditor for authorized assessments"
  homepage "https://github.com/Vampsecure-Labs/vamp-wp2shell-audit"
  url "https://files.pythonhosted.org/packages/54/50/290e567c954d584a12b02574c579f5cb5687d9e38ec8cc77cbfac1257748/vamp_wp2shell_audit-1.2.tar.gz"
  sha256 "572726f330f1743188c8056cd1957159f20c2e837ca0ea8a89c2821c5744ec4f"
  license "MIT"
  version "1.2"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-wp2shell-audit==1.2"
    bin.install_symlink libexec/"bin/vamp-wp2shell-audit"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-wp2shell-audit --help 2>&1")
  end
end
