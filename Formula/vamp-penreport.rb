# © VampSecure Studios — VampSecure Labs Security Research Division
class VampPenreport < Formula
  include Language::Python::Virtualenv

  desc "Penetration test report generator for VampSecure Labs assessments"
  homepage "https://github.com/Vampsecure-Labs/vamp-penreport"
  url "https://files.pythonhosted.org/packages/b8/7f/bc2afcc71a03973d66957d774ade77a04c2214a61b8100b63ea4b3b4caa7/vamp_penreport-2.5.tar.gz"
  sha256 "fda7f22d64840d196c8c488b1a337572ee9966464154249178560311e15d9147"
  license "MIT"
  version "2.5"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-penreport==2.5"
    bin.install_symlink libexec/"bin/vamp-penreport"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-penreport --help 2>&1")
  end
end
