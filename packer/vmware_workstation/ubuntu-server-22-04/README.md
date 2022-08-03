# Packer für Ubuntu Server 22.04

## Um was geht es ?

Mit diesem Templates könnt ihr automatisiert einen Ubuntu Server 22-04 in eurer lokalen VMware Workstation Umgebung erzeugen. Dies wird mit Hilfe von [Packer](https://www.packer.io/) realisiert.


## Vorasusetzungen

- [Packer](https://www.packer.io/downloads.html)
  - <https://www.packer.io/intro/getting-started/install.html>
- Hypervisor
  - [VMware Workstation](https://www.vmware.com/products/workstation-pro.html)

## Konfiguration für euere Umgebung

In der ***ubuntu-2204-daily.pkr.hcl*** müssen folgende Parameter angepasst werden:

***"iso_url"*** - Pfad zur ISO Datei

***"output_directory"*** - Pfad zum Speicherort des erzeugten Templates

***"network"*** - Euer in VMware Workstation verwendetes Netzwerk

## Wie startet man die Images-Erzeugung

Befehl zum Erzeugen des VMware Workstation Images:

In der Powershell einfach folgenden BEfehl ausführen:

```sh
packer build .\ubuntu-2204-daily.pkr.hcl
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

