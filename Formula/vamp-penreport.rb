# © VampSecure Studios — VampSecure Labs Security Research Division
class VampPenreport < Formula
  include Language::Python::Virtualenv

  desc "Penetration test report generator for VampSecure Labs assessments"
  homepage "https://github.com/Vampsecure-Labs/vamp-penreport"
  url "https://files.pythonhosted.org/packages/ac/6c/2b6944a38dea0888a62f78a0af92ad643587764b28a27ba98650cc0d26f0/vamp_penreport-2.4.tar.gz"
  sha256 "33a25826020d0d6c093e785214b53e2c3fcd29a9071ae92972a81433c2684956"
  license "MIT"
  version "2.4"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-penreport==2.4"
    bin.install_symlink libexec/"bin/vamp-penreport"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-penreport --help 2>&1")
  end
end
