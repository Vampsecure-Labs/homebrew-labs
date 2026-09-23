# © VampSecure Studios — VampSecure Labs Security Research Division
class VampSecretsScanner < Formula
  include Language::Python::Virtualenv

  desc "Static secrets and credentials scanner with git history analysis and Shannon entropy detection"
  homepage "https://github.com/Vampsecure-Labs/vamp-secrets-scanner"
  url "https://files.pythonhosted.org/packages/3b/4b/a8cc680c2841fd2f26ea034b89e4264243cee50b0e3ec51d529b1ac3cbc6/vamp_secrets_scanner-2.1.tar.gz"
  sha256 "722a3128d860f39a36e63980811806c77b4232680441d9286da320f947637f02"
  license "MIT"
  version "2.1"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-secrets-scanner==2.1"
    bin.install_symlink libexec/"bin/vamp-secrets-scanner"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-secrets-scanner --help 2>&1")
  end
end
