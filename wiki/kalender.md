---
title: Kalender
layout: wiki
type: wiki
author: Niklas von Hirschfeld
date: 2023-03-12
categories: [wiki, kalender, sabredav]
lastmod: 2023-03-12
tags: []
comments: true
---


# Einleitung

Installation und Vergleich von verschiedenen `DAV` Servern und Clients.

## Was ist CalDAV bzw wie funktioniert es?

- Dateinbasiert (ics/vcf)
- erweitert `http` um Methode
    - bzw erweiterung von `WebDAV`
- `iCalendar` Format

## iCalendar

- ein Datenformat
- 

### Einschraenkungen

- nich mit "Mondkalendern" kompatibel (wird in Israel und Saudi-Arabien genutzt)
- Todos (VTODO) und Journales (VJOURNAL) werden nicht von allen Serven / Clients unterstuezt

### Kernobjekt

Die Datei muss mit "BEGIN:VCALENDAR" beginnen und mit "END:VCALENDAR" auf hoeren.
Der Inhalt zwischen diesen Zeilen wird als "icalbody" bezeichnent. Der Body **muss**
die Kalendereigenschaften "PRODID:" und "VERSION" enthalten. Darueber hinaus muss es mindestens
eine Kalenderkomponente enthalten.

Hier ein Beispiel fuer das Event "Treffen XY" welchen vom 14. Juli 1997 um 17:00
Uhr (UTC) bis zum 15. Juli 1997 um 02:59:59 Uhr statt findet.

```CalDAV
BEGIN:VCALENDAR

VERSION:2.0
PRODID:-//hacksw/handcal//NONSGML v1.0//EN

BEGIN:VEVENT

UID:uid1@example.com
DTSTAMP:19970714T170000ZORGANIZER;CN=John
Doe:
MAILTO:john.doe@example.com
DTSTART:19970714T170000Z
DTEND:19970715T035959Z
SUMMARY:Treffen XY
GEO:48.85299;2.36885

END:VEVENT
END:VCALENDAR
```

# Installation

## Radicale

Einfach per pip installieren

```bash
# Run the following command as root or
# add the --user argument to only install for the current user
$ python3 -m pip install --upgrade radicale
$ python3 -m radicale --storage-filesystem-folder=~/.var/lib/radicale/collections
```

### Configuration

Radicale list die Konfigurationsdatei von `/etc/radicale/config` und `~/.config/radicale/config`.
Es koennen noch eigene Pfade mit `--config` angegeben werden.

#### Authentifizierung

Standardmaessig wird der Benutzername und das Password **nicht** ueberprueft.
Wenn der Server online zugaenglich ist, sollte das geaendert werden.

Eine sichere moeglichkeit dies zu erreichen, ist eine `user`-Datei die mit 
`htpasswd` generiert wird.

```bash
# Create a new htpasswd file with the user "user1"
$ htpasswd -c /path/to/users user1

# Add another user
$ htpasswd /path/to/users user2
```

Die Authentifizierungsmethode kann wie folgt eingestellt werden.

```config
[auth]
type = htpasswd
htpasswd_filename = /path/to/users
# encryption method used in the htpasswd file
htpasswd_encryption = md5
```

#### Addresse

Die Standardeinstellung als Addresse ist `localhost`. Wenn man das aendern moechte
kann man das auch in der Konfigurationsdatei:

```config
[server]
hosts = 0.0.0.0:5232, [::]:5232
```

#### Dateinordner

Auch der Ordner sollte angegeben werden:

```config
[storage]
filesystem_folder = /path/to/storage
```

#### Limits

Man hat die Möglichkeit eine Limitierung für verschiedene Dinge einzustellen:

```$HOME/.config/radicale/config
[server]
max_connections = 20
# 100 Megabyte
max_content_length = 100000000
# 30 seconds
timeout = 30

[auth]
# Average delay after failed login attempts in seconds
delay = 1
```

#### Service

> Auf Uberspace

```~/etc/services.d/radicale.ini
[program:radicale]
command=radicale
```

Nach dem Konfigurieren kann der Service mit `supervisord`
gestartet werden.

```bash
$ supervisorctl reread

$ supervisorctl update

$ supervisorctl status
SERVICE         RUNNING   pid 26020, uptime 0:03:14
```

Um den Webserver zum Laufen zu bringen, muss das Backend auf der Domain eingestellt werden.

**ACHTUNG** Setze die Domain `/` weise. Falls du andere Protokolle (wie Apache)
auf `/` laufen hast. Werden diese einfach überschrieben.

Um eine liste der laufenden Backends zu bekommen: `uberspace web backend list`

```shell
uberspace web backend set / --http --port 8000
```

## Sabre

An der "Wurzel" des Projektes `sabre/dav` per `composer` installieren. Das kann 
man auch in dem unterordner des Webservers.

Beispiel: `vonhirschfeld.eu/webdav/`

```bash
composer require sabre/dav ~3.2.0

composer update sabre/dav
```

Jetzt kann man einen simplen Server erstellen. Dafuer muss aber der genaue Weg zu
`vendor/autoload.php` bekannt sein. Dieser befindet sich Standardmaessig im dem 
Ordener sein, in dem man zuvor `sabre/dav` installiert hat.

### Ein einfacher Server

Zuerst muessen die Ordner `data` und `public` erstellt werden:

```bash
mkdir data
mkdir public
```

Der `data` Ordner beinhaltet spaeter informationen die von `SabreDAV` benoetigt werden,

Jetzt muessen beide Order zugaenglich gemcht werden:

```bash
chmod a+rwx data public
```

Als naechstes erstellen wir den server mit der Datei `server.php` welche wie folgt aussehen kann:

```php
<?php

use
    Sabre\DAV;

// The autoloader
require 'vendor/autoload.php';

// Now we're creating a whole bunch of objects
$rootDirectory = new DAV\FS\Directory('public');

// The server object is responsible for making sense out of the WebDAV protocol
$server = new DAV\Server($rootDirectory);

// If your server is not on your webroot, make sure the following line has the
// correct information
$server->setBaseUri('/url/to/server.php');

// The lock manager is reponsible for making sure users don't overwrite
// each others changes.
$lockBackend = new DAV\Locks\Backend\File('data/locks');
$lockPlugin = new DAV\Locks\Plugin($lockBackend);
$server->addPlugin($lockPlugin);

// This ensures that we get a pretty index in the browser, but it is
// optional.
$server->addPlugin(new DAV\Browser\Plugin());

// All we need to do now, is to fire up the server
$server->exec();
```

#### Die basis URL

Es ist wichtig die basis URL richtig zu setzen.

```php
$server->setBaseUri('/url/to/server.php');
```

Diese Pfad soll direkt zu dem server Script zeigen. 

Wenn also die domain zu dem script folgende ist:

```
http://mydomain/sabredav/server.php
```

Dann sollte die basis URL folgende sein:

```
/sabredav/server.php
```

Wenn alles korrekt aufgesetzt wurde, sollte man jetzt schon eine Oberflaeche sehen,
wenn man den Server in einem Brower aufruft.

### Authentifizierung

- [Officielle Dokumentation](https://sabre.io/dav/authentication/)

Es gibt verschiedenen Authentifizierungsbackends. 

Ich habe mich hier fuer ein PDO backend entschieden, welches entweder mit `MySQL`
oder `SQLite` funktioniert.

Andere Moeglichkeiten sind:

- File
- IMAP
- Apache
- BasicCallBack


Beispiele fuer die SQL Tabellen finden sie [hier](https://github.com/sabre-io/dav/tree/master/examples/sql).

Um das `Plugin` anzuwenden kannd er folgende Code zu dem Server (`server.php`) 
hinzugefuegt werden:

```php
use Sabre\DAV\Auth;

$pdo = new \PDO('sqlite:data/db.sqlite');
// or alternatively:
// $pdo = new \PDO('mysql:dbname=sabredav','username','password');

// Throwing exceptions when PDO comes across an error:
$pdo->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);

// Creating the backend.
$authBackend = new Auth\Backend\PDO($pdo);

// We're assuming that the realm name is called 'SabreDAV'.
$authBackend->setRealm('SabreDAV');

// Creating the plugin.
$authPlugin = new Auth\Plugin($authBackend);

// Adding the plugin to the server.
$server->addPlugin($authPlugin);
```

Den Code kann man einfache nach der einbindung des Browserplugins einfuegen.

Also nach folgender Zeile:

```php
// This ensures that we get a pretty index in the browser, but it is
// optional.
$server->addPlugin(new DAV\Browser\Plugin());
```

## Administration:

### Neuer Benutzer:

Falls es noch keine Tabelle fuer Benutzer gitb, kann sie wie folgt erstellt werde:

```sql
CREATE TABLE users (
        id INTEGER UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
        username VARBINARY(50),
        digesta1 VARBINARY(32),
        UNIQUE(username)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

```

Neue Benutzer koennen wie folgt eingetragen werden. Dabei wird das Password als

```sql
INSERT INTO users (username,digesta1) VALUES
('admin',  '87fd274b7b6c01e48d7c2f965da8ddf7');
```

Das Password bzw `digesta1` ist der `md5` hash aus `username:realm:password`.

Der Reaml kann selber ausgewaehlt werden, muss aber einmal festgelegt werden.
Dies geschieht in der `server.php` Datei in der Zeile:

```php
$authBackend->setRealm('SabreDAV');
```

## Baikal

Baikal ist ein erweitertes Webinterface fuer SabreDAV. Die Installation und Administration sind stark vereinfacht.

Zur Installation wird Baikal als Zip heruntergeladen. Der entpackte Ordner sollte 

## Cyrus imap

## Zusammenfassung und Vergleich

# Clients

## Webdavbrücken

## Todo

## Kalender

## Kontakte

## Zusammenfassung

# Zusammenfassung
