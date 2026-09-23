# © VampSecure Studios — VampSecure Labs Security Research Division
class VampShodanHunt < Formula
  include Language::Python::Virtualenv

  desc "Shodan OSINT hunter for attack-surface mapping in authorized audits"
  homepage "https://github.com/Vampsecure-Labs/vamp-shodan-hunt"
  url "https://files.pythonhosted.org/packages/1d/a6/4787439872242dec04feac640ac08854d3ae6891c9f52b3b5d69882fc90e/vamp_shodan_hunt-1.1.tar.gz"
  sha256 "88b4a03aa95f14216d8d3ef7b7aea97ce322fe84df7589f4f44b42bc3ec0d37d"
  license "MIT"
  version "1.1"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-shodan-hunt==1.1"
    bin.install_symlink libexec/"bin/vamp-shodan-hunt"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-shodan-hunt --help 2>&1")
  end
end
