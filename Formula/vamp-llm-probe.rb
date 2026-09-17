# © VampSecure Studios — VampSecure Labs Security Research Division
class VampLlmProbe < Formula
  include Language::Python::Virtualenv

  desc "LLM API security auditor — prompt injection, jailbreak, ASCII smuggling"
  homepage "https://github.com/Vampsecure-Labs/vamp-llm-probe"
  url "https://files.pythonhosted.org/packages/aa/f2/74bb86d3b6bcd7849029c28489021b5633878dbc05f4a834edc76f088fd0/vamp_llm_probe-1.5.0.tar.gz"
  sha256 "670daeab26a3d69aacd6881435bfcc2f1666a47c1b3640c350d01283ae571cf8"
  license "MIT"
  version "1.5.0"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-llm-probe==1.5.0"
    bin.install_symlink libexec/"bin/vamp-llm-probe"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-llm-probe --help 2>&1")
  end
end
