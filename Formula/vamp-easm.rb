# © VampSecure Studios — VampSecure Labs Security Research Division
class VampEasm < Formula
  include Language::Python::Virtualenv

  desc "External Attack Surface Management (EASM) scanner for authorized audits"
  homepage "https://github.com/Vampsecure-Labs/vamp-easm"
  url "https://files.pythonhosted.org/packages/source/v/vamp-easm/vamp_easm-1.5.tar.gz"
  sha256 "3bc3551182c572f336e68c438289dfaa297f1dec41180f72207991a6559e381c"
  license "MIT"
  version "1.5"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-easm==1.5"
    bin.install_symlink libexec/"bin/vamp-easm"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-easm --help 2>&1")
  end
end
