# © VampSecure Studios — VampSecure Labs Security Research Division
class VampSecretsScanner < Formula
  include Language::Python::Virtualenv

  desc "Static secrets and credentials scanner with git history analysis and Shannon entropy detection"
  homepage "https://github.com/Vampsecure-Labs/vamp-secrets-scanner"
  url "https://files.pythonhosted.org/packages/0d/37/49b77532b214b1eadaee5af7b4b7af08e89983077a45416f582baec028b2/vamp_secrets_scanner-2.3.tar.gz"
  sha256 "336d836ba6c1159af0aa140901c88be6f9aa5f7559dd910054289cb045582904"
  license "MIT"
  version "2.3"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-secrets-scanner==2.3"
    bin.install_symlink libexec/"bin/vamp-secrets-scanner"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-secrets-scanner --help 2>&1")
  end
end
