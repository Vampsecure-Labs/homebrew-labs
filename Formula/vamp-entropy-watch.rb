# © VampSecure Studios — VampSecure Labs Security Research Division
class VampEntropyWatch < Formula
  include Language::Python::Virtualenv

  desc "High-entropy file and process monitor for authorized security assessments"
  homepage "https://github.com/Vampsecure-Labs/vamp-entropy-watch"
  url "https://files.pythonhosted.org/packages/a5/36/416e82ba00888633e0ea80abd7bb813b214e0eb0d03c81388ee5bee89520/vamp_entropy_watch-2.2.tar.gz"
  sha256 "95de1a5a8bd643f7bea0b473899a1fb354ba5d1b438e6ea0cbd185078d329eed"
  license "MIT"
  version "2.2"

  depends_on "python@3.12"

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "vamp-entropy-watch==2.2"
    bin.install_symlink libexec/"bin/vamp-entropy-watch"
  end

  test do
    assert_match "VampSecure", shell_output("#{bin}/vamp-entropy-watch --help 2>&1")
  end
end
