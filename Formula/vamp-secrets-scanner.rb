# © VampSecure Studios — VampSecure Labs Security Research Division
class VampSecretsScanner < Formula
  include Language::Python::Virtualenv

  desc "Static secrets and credentials scanner with git history analysis and Shannon entropy detection"
  homepage "https://github.com/Vampsecure-Labs/vamp-secrets-scanner"
  url "https://files.pythonhosted.org/packages/b3/56/789353f6f6931efbe05af25715f0da3c79adc2ef2c4726042cf2972398ff/vamp_secrets_scanner-2.4.tar.gz"
  sha256 "b7e16c1ed882aa694cfedfb0cb289478d4775b50d9e267bb94d94a307a0a9f24"
  license "MIT"
  version "2.4"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-secrets-scanner==2.4"
    bin.install_symlink libexec/"bin/vamp-secrets-scanner"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-secrets-scanner --help 2>&1")
  end
end
