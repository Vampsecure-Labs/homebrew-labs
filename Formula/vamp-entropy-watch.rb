# © VampSecure Studios — VampSecure Labs Security Research Division
class VampEntropyWatch < Formula
  include Language::Python::Virtualenv

  desc "High-entropy file and process monitor for authorized security assessments"
  homepage "https://github.com/Vampsecure-Labs/vamp-entropy-watch"
  url "https://files.pythonhosted.org/packages/44/86/2a9442549eba0847f1a55d4a1e564bf6aa1e31788d09ba372461a2de6029/vamp_entropy_watch-2.1.tar.gz"
  sha256 "6cb4ff9d6745e1cc15923957ce6e96785c69421eac6349db445f2fc2a04d7d68"
  license "MIT"
  version "2.1"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-entropy-watch==2.1"
    bin.install_symlink libexec/"bin/vamp-entropy-watch"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-entropy-watch --help 2>&1")
  end
end
