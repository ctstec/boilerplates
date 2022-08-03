# Packer für Windows Server 2022

## Um was geht es ?

Mit diesem Templates könnt ihr automatisiert einen Windows Server 2022 in eurer lokalen VMware Workstation Umgebung erzeugen. Dies wird mit Hilfe von [Packer](https://www.packer.io/) realisiert.

Während der Templateerstellung werden einige Scripte ausgeführt. Diese installalieren z.B. VMware Tool oder machen WIndows Updates.

## Vorasusetzungen

- [Packer](https://www.packer.io/downloads.html)
  - <https://www.packer.io/intro/getting-started/install.html>
- Hypervisor
  - [VMware Workstation](https://www.vmware.com/products/workstation-pro.html)

## Konfiguration für euere Umgebung

In der ***winsrv-2022-gui.json*** müssen folgende Parameter angepasst werden:

***"iso_url"*** - Pfad zur ISO Datei

***"output_directory"*** - Pfad zum Speicherort des erzeugten Templates

***"network"*** - Euer in VMware Workstation verwendetes Netzwerk

## Wie startet man die Images-Erzeugung

Befehl zum Erzeugen des VMware Workstation Images:

In der Powershell einfach folgenden BEfehl ausführen:

```sh
packer build .\winsrv-2022-gui.json
```

## autounattended.xml für automatische Installation

Im Verzeichnis ***"scripts/uefi"*** befindet sich die Konfiguration für due Unattended-Installation.

Hier können Anpassungen gemacht werden.

## Scripte nach der Installation

Die Scripte welche nach der Installation ausgeführt werden findet ihr im Verzeichnis ***"/scripts/"***

### - vmware-tools.ps1

Durch dieses Script werden die VMware Tools heruntergeladen und installiert.

### - setup.ps1

Hier werden einige unnötige EInträge aus der Registry entfernt.

### - win-update.ps1

Die aktuellen Windows Updates werden heruntergeladen und installiert.

### - cleanup.ps1

Zum Abschluss der Installation werden temporäre Dateien bereinigt.

## Default Zugangsdaten

Die Standardzugangsdaten sind:

|Benutzername|Passwort|
|--------|--------|
|administrator|packer|
