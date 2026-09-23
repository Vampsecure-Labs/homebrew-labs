# © VampSecure Studios — VampSecure Labs Security Research Division
class VampShodanHunt < Formula
  include Language::Python::Virtualenv

  desc "Shodan OSINT hunter for attack-surface mapping in authorized audits"
  homepage "https://github.com/Vampsecure-Labs/vamp-shodan-hunt"
  url "https://files.pythonhosted.org/packages/85/56/ef0b7a0a83571ffe1412d3c103531554d9762e446e5fa38166b00a85a42a/vamp_shodan_hunt-1.2.tar.gz"
  sha256 "65126a501979441ad2f1bd94906da79f9d3ee031c2613c461ea5f4dda8d4a933"
  license "MIT"
  version "1.2"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-shodan-hunt==1.2"
    bin.install_symlink libexec/"bin/vamp-shodan-hunt"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-shodan-hunt --help 2>&1")
  end
end
