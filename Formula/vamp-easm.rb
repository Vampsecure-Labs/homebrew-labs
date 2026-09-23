# © VampSecure Studios — VampSecure Labs Security Research Division
class VampEasm < Formula
  include Language::Python::Virtualenv

  desc "External Attack Surface Management (EASM) scanner for authorized audits"
  homepage "https://github.com/Vampsecure-Labs/vamp-easm"
  url "https://files.pythonhosted.org/packages/04/1d/3d3d7e6ebef7abbac11b173343714733eea7fffc4a1bd6e3656b5f641ea6/vamp_easm-1.3.tar.gz"
  sha256 "ba72aee2512cd32fa68638f48268717a1de0d21cf70d4088c797e04f52cdb7e9"
  license "MIT"
  version "1.3"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-easm==1.3"
    bin.install_symlink libexec/"bin/vamp-easm"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-easm --help 2>&1")
  end
end
