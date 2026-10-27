#!/usr/bin/env python3
# © VampSecure Studios — VampSecure Labs Security Research Division
"""
sync_formulae.py — Mantiene las fórmulas Homebrew de este tap alineadas con la
última versión publicada en PyPI.

Para cada Formula/*.rb cuyo `url` apunte a files.pythonhosted.org, compara la
versión declarada con la última de PyPI; si difiere, actualiza la URL, la línea
`version`, el pin `<pkg>==<ver>` del pip_install y el `sha256` del sdist.

Las fórmulas que no se sirven desde PyPI (p.ej. assets de releases de GitHub) se
dejan intactas y se informan. Sin dependencias externas: solo stdlib.
"""
from __future__ import annotations

import hashlib
import json
import re
import sys
import urllib.request
from pathlib import Path

FORMULA_DIR = Path(__file__).resolve().parent.parent / "Formula"
PYPI_HOST = "files.pythonhosted.org"


def pypi_latest(pkg: str) -> tuple[str, str] | None:
    """Devuelve (version, sha256_sdist) de la última release de PyPI, o None."""
    try:
        with urllib.request.urlopen(f"https://pypi.org/pypi/{pkg}/json", timeout=30) as r:
            data = json.load(r)
    except Exception as exc:  # noqa: BLE001
        print(f"  [WARN] {pkg}: no se pudo consultar PyPI ({exc})")
        return None
    ver = data["info"]["version"]
    sdist = next((u for u in data["urls"] if u["packagetype"] == "sdist"), None)
    if not sdist:
        print(f"  [WARN] {pkg}: sin sdist en PyPI {ver}")
        return None
    return ver, sdist["digests"]["sha256"]


def update_formula(path: Path) -> bool:
    text = path.read_text(encoding="utf-8")
    url_m = re.search(r'url\s+"([^"]+)"', text)
    ver_m = re.search(r'version\s+"([^"]+)"', text)
    if not url_m or not ver_m:
        return False
    url, cur = url_m.group(1), ver_m.group(1)
    if PYPI_HOST not in url:
        print(f"  [skip] {path.name}: no se sirve desde PyPI")
        return False

    pkg = path.stem  # vamp-x.rb -> vamp-x
    pyname = pkg.replace("-", "_")
    latest = pypi_latest(pkg)
    if not latest:
        return False
    ver, sha = latest
    if ver == cur:
        return False

    new = text
    new = new.replace(f"{pyname}-{cur}.tar.gz", f"{pyname}-{ver}.tar.gz")
    new = re.sub(r'(version\s+")' + re.escape(cur) + r'"', r"\g<1>" + ver + '"', new)
    new = new.replace(f"{pkg}=={cur}", f"{pkg}=={ver}")
    new = re.sub(r'sha256\s+"[0-9a-f]{64}"', f'sha256 "{sha}"', new, count=1)

    if (f"{pyname}-{ver}.tar.gz" not in new or f'version "{ver}"' not in new
            or f'sha256 "{sha}"' not in new):
        print(f"  [ERROR] {path.name}: sustitución incompleta, no se modifica")
        return False

    path.write_text(new, encoding="utf-8")
    print(f"  [bump] {path.name}: {cur} -> {ver}")
    return True


def main() -> int:
    changed = 0
    for rb in sorted(FORMULA_DIR.glob("*.rb")):
        if update_formula(rb):
            changed += 1
    print(f"\nFórmulas actualizadas: {changed}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
