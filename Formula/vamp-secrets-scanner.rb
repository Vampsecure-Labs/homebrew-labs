# © VampSecure Studios — VampSecure Labs Security Research Division
class VampSecretsScanner < Formula
  include Language::Python::Virtualenv

  desc "Static secrets and credentials scanner with git history analysis and Shannon entropy detection"
  homepage "https://github.com/Vampsecure-Labs/vamp-secrets-scanner"
  url "https://files.pythonhosted.org/packages/source/v/vamp-secrets-scanner/vamp_secrets_scanner-2.7.0.tar.gz"
  sha256 "53d7b55de3f4317e21b3754439feb39673fd413cf516fee5ac2d58506487b0af"
  license "AGPL-3.0-only"
  version "2.7.0"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-secrets-scanner==2.7.0"
    bin.install_symlink libexec/"bin/vamp-secrets-scanner"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-secrets-scanner --help 2>&1")
  end
end
