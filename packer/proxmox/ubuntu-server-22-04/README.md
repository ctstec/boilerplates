# Packer für Ubuntu Server 22.04

## Um was geht es ?

Mit diesem Templates könnt ihr automatisiert einen Ubuntu Server 22-04 in eurer Proxmox erzeugen. Dies wird mit Hilfe von [Packer](https://www.packer.io/) realisiert.

## Vorasusetzungen

- [Packer](https://www.packer.io/downloads.html)
  - <https://www.packer.io/intro/getting-started/install.html>
- Hypervisor
  - [Proxmox](https://www.proxmox.com/de/)

## Konfiguration für euere Umgebung

In der ***credenzials.pkr.hcl*** müssen folgende Parameter angepasst werden:

***"proxmox_api_url"*** - Anpassung der IP-Adresse

***"proxmox_api_token_id"*** - Erzeugte API ID aus dem Proxmox Webinterface

***"proxmox_api_token_secret"*** - Erzeugtes Token Secret aus dem Proxmox Webinterface

In der ***ubuntu-server-jammy.pkr.hcl*** müssen folgende Parameter angepasst werden:

***"iso_file"*** - Pfad zur ISO Datei

***"node"*** - Name des Proxmox Node, solltet ihr z.B. ein Cluster verwenden

***"storage_pool"*** - Wo soll die VM gespeichert werden

In der ***http/user-data*** können folgende Parameter angepasst werden:

***"passwd"*** - Kennwort für den User (steht auch in der ***ubuntu-server-jammy.pkr.hcl***)

***"packages"*** - Was wollt ihr standardmäßig installiert haben?

## Wie startet man die Images-Erzeugung

Befehl zum Erzeugen des Templates in Proxmox:

In der Powershell einfach folgenden BEfehl ausführen:

```sh
packer build -var-file='..\credentials.pkr.hcl' .\ubuntu-server-jammy.pkr.hcl
```

## Default Zugangsdaten

Die Standardzugangsdaten sind:

|Benutzername|Passwort|
|--------|--------|
|ubuntu|ubuntu|

## Passwort Erzeugung

Auf einer anderen Linux Maschine kann das verschlüsselte Kennwort für die ***"user-data"*** erzeugt werden.

```sh
apt-get install whois
mkpasswd -m sha-512 --rounds=4096
```