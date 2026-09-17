# © VampSecure Studios — VampSecure Labs Security Research Division
class VampPenreport < Formula
  include Language::Python::Virtualenv

  desc "Penetration test report generator for VampSecure Labs assessments"
  homepage "https://github.com/Vampsecure-Labs/vamp-penreport"
  url "https://files.pythonhosted.org/packages/c6/fd/20200a190748c892cb864154face63e30a1144a2288db3e46685963a11e8/vamp_penreport-2.1.tar.gz"
  sha256 "c6ab8e66e8f5b1693293398796c33bcd4aa16961c7310eeb6beeb49545859c65"
  license "MIT"
  version "2.1"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-penreport==2.1"
    bin.install_symlink libexec/"bin/vamp-penreport"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-penreport --help 2>&1")
  end
end
