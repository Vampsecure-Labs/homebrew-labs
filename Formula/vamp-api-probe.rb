# © VampSecure Studios — VampSecure Labs Security Research Division
class VampApiProbe < Formula
  include Language::Python::Virtualenv

  desc "REST API security DAST scanner: BOLA, BFLA, mass assignment, rate limiting and OWASP API Top 10"
  homepage "https://github.com/Vampsecure-Labs/vamp-api-probe"
  url "https://files.pythonhosted.org/packages/source/v/vamp-api-probe/vamp_api_probe-1.0.tar.gz"
  sha256 "73d7f3a9f13e8fd3393068c870e81bede1ea7f39d80d2265683c0b9585853dcc"
  license "AGPL-3.0-only"
  version "1.0"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-api-probe==1.0"
    bin.install_symlink libexec/"bin/vamp-api-probe"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-api-probe version 2>&1")
  end
end
