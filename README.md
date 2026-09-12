# homebrew-labs

> **VampSecure Labs Security Research Division**

Homebrew tap para las herramientas de auditoría de seguridad de [VampSecure Labs](https://vampsecurestudios.com/labs).

## Instalación del tap

```bash
brew tap vampsecure-labs/labs
```

## Herramientas disponibles

| Fórmula | Descripción |
|---------|-------------|
| `vamp-cloud-enum` | Enumeración de activos cloud expuestos (AWS/GCP/Azure/DO) |
| `vamp-cve-oracle` | Inteligencia de vulnerabilidades CVE con EPSS + CISA KEV |
| `vamp-easm` | External Attack Surface Management scanner |
| `vamp-forticheck` | Escáner CVE para appliances de red (FortiOS, PAN-OS, Cisco, Juniper) |

## Ejemplos de uso

```bash
brew install vampsecure-labs/labs/vamp-cloud-enum
vamp-cloud-enum --domain empresa.com --cloud all

brew install vampsecure-labs/labs/vamp-cve-oracle
vamp-cve-oracle --cve CVE-2024-1234

brew install vampsecure-labs/labs/vamp-easm
vamp-easm --domain objetivo.com

brew install vampsecure-labs/labs/vamp-forticheck
vamp-forticheck --target 192.168.1.1
```

## Repositorio de herramientas

Catálogo completo en [Vampsecure-Labs](https://github.com/Vampsecure-Labs) y en [vampsecurestudios.com/labs](https://vampsecurestudios.com/labs).

© VampSecure Studios — VampSecure Labs Security Research Division
