# © VampSecure Studios — VampSecure Labs Security Research Division
class VampApiProbe < Formula
  include Language::Python::Virtualenv

  desc "REST API security DAST scanner: BOLA, BFLA, mass assignment, rate limiting and OWASP API Top 10"
  homepage "https://github.com/Vampsecure-Labs/vamp-api-probe"
  url "https://files.pythonhosted.org/packages/ed/9b/a7b07928877ed163845dc90a4787639677305e6a29c7a988d7141ad0cee4/vamp_api_probe-1.2.tar.gz"
  sha256 "4724bb7b7d43e2cc03e2cb7bbf7caf2317204eef1736035f60a73a0652a85945"
  license "AGPL-3.0-only"
  version "1.2"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-api-probe==1.2"
    bin.install_symlink libexec/"bin/vamp-api-probe"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-api-probe version 2>&1")
  end
end
