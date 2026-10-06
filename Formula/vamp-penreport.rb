# © VampSecure Studios — VampSecure Labs Security Research Division
class VampPenreport < Formula
  include Language::Python::Virtualenv

  desc "Penetration test report generator for VampSecure Labs assessments"
  homepage "https://github.com/Vampsecure-Labs/vamp-penreport"
  url "https://files.pythonhosted.org/packages/source/v/vamp-penreport/vamp_penreport-2.7.0.tar.gz"
  sha256 "107bd55e94204df18fb7f6f1eda5d735ef0a635ce3f9aec9ac0d754f75551d6b"
  license "AGPL-3.0-only"
  version "2.7.0"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-penreport==2.7.0"
    bin.install_symlink libexec/"bin/vamp-penreport"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-penreport --help 2>&1")
  end
end
