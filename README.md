# Zammad IT Support Monatsprojekt
    Warum eine saubere Dateitrennung im IT-Support essenziell ist:

        ​Schnelle Reaktionszeit (Troubleshooting): Im Fehlerfall zählt jede Minute. Eine klare Ordnerstruktur (z. B. getrennte Ordner für /scripts und /docs) garantiert, dass der Support-Mitarbeiter das richtige Skript oder die passende Anleitung sofort findet, ohne suchen zu müssen.
        ​Fehlervermeidung: Die strikte Trennung von ausführbarem Code (Skripte) und informativen Dateien (Dokumentationen, Screenshots) verhindert, dass im laufenden Betrieb versehentlich Automatisierungen ausgelöst werden, wenn man eigentlich nur etwas nachlesen wollte.

        Kollaboration und Übergabe: Im Support arbeiten oft mehrere Kollegen oder Schichten am selben System. Eine standardisierte Struktur sorgt dafür, dass sich jeder sofort zurechtfindet und Aufgaben nahtlos übergeben werden können.
        ​Saubere Versionierung: Textbasierte Dateien (Skripte, Configs) lassen sich über Git perfekt versionieren und vergleichen. Große Binärdateien (Screenshots) blähen das Repository auf und sollten daher logisch getrennt abgelegt werden.

1. Die Transferfrage aus Aufgabe 1 

     ​Struktur und Übersicht: Bei einem IT-Support- und Automatisierungsprojekt wächst die Menge an Dateien schnell an. Durch die saubere Trennung in Ordner wie docker, docs, scripts oder screenshots behalten sowohl man selbst als auch andere Teammitglieder oder Prüfer sofort den Überblick. 

    ​Wartbarkeit und Versionierung: Technische Konfigurationen (docker-compose.yml) haben einen anderen Zweck als Dokumentationen oder Skripte. Getrennte Ordner verhindern, dass Skripte aus Versehen überschrieben oder Konfigurationen falsch verlinkt werden.
    ​Nachvollziehbarkeit für Prüfer: Ein sauber strukturiertes Git-Repository zeigt Professionalität. Der Prüfer sieht auf den ersten Blick, wo die technische Grundlage, wo die Doku und wo die Nachweise liegen.


2. Die Doku-Tabelle für Aufgabe 2 (Theoretische Erklärung)


    ​Zammad Web: Das ist die eigentliche Weboberfläche, über die Nutzer und Support-Mitarbeiter das System im Browser bedienen und Tickets bearbeiten.

    ​Zammad Scheduler: Ein Hintergrunddienst, der zeitgesteuerte Aufgaben wie Automatisierungen, Trigger und das regelmäßige Abrufen von E-Mails ausführt.

    ​Zammad Websocket: Dieser Dienst sorgt für die Echtzeit-Aktualisierung im Browser. Wenn ein neues Ticket reinkommt, erscheint es sofort bei den Agenten auf dem Bildschirm, ohne dass die Seite neu geladen werden muss.

    ​PostgreSQL: Das ist die relationale Datenbank. Hier werden alle Stammdaten wie Tickets, Benutzer, Gruppen, Rollen und Systemeinstellungen dauerhaft (persistent) gespeichert.

    ​Search Dienst: Meistens Elasticsearch. Ein extrem schneller Suchindex, der dafür sorgt, dass man Tickets, Knowledge Base Artikel und Nutzer in Sekundenbruchteilen im Volltext durchsuchen kann.

    ​Memcached: Ein pfeilschneller Arbeitsspeicher-Zwischenspeicher (Cache). Er beschleunigt das gesamte System, indem er häufig genutzte Daten vorhält und so die PostgreSQL-Datenbank entlastet.

    ​Backup Container: Ein dedizierter Dienst, der für das Backup- und Restore-Konzept zuständig ist. Er führt automatisierte Sicherungen der Datenbank und der Anhänge durch, um Datenverlust zu verhindern.


3. Die beiden Transferfragen aus Aufgabe 2

    ​Warum ist eine Datenbank bei Zammad notwendig?
    ​Antwort: Zammad generiert und verwaltet dynamische Daten wie Tickets, Benutzerprofile und Einstellungen. Ohne eine Datenbank wie PostgreSQL würden all diese Informationen im flüchtigen Arbeitsspeicher liegen und bei jedem Neustart des Systems komplett verloren gehen. Die Datenbank sorgt für die persistente, strukturierte Speicherung.

    ​Warum kann ein Suchdienst notwendig sein?

    ​Antwort: Ein IT-Supportsystem sammelt im Laufe der Zeit tausende von Tickets und Knowledge Base Artikeln an. Eine normale Datenbankabfrage wäre bei solchen Datenmengen viel zu langsam. Ein dedizierter Suchdienst (wie Elasticsearch) baut einen Suchindex auf und ermöglicht dadurch eine rasend schnelle Volltextsuche in Echtzeit.
4.  Fehlerdokumentation Start Docker-compose up- d

Fehlerdokumentation für Aufgabe 3 (README)

    ​Problembeschreibung: Beim ersten Startversuch des Docker-Compose-Stacks brach der Prozess ab mit der Fehlermeldung, dass die im env_file-Pfad angegebene Datei scripts/.env nicht gefunden werden konnte.
    ​Ursache: Die verwendete Docker-Compose-Vorlage enthielt standardmäßig den Testdienst api-runner mit einer aktivierten Einbindung einer Umgebungsvariablen-Datei für die spätere API-Integration (Woche 4), welche zu diesem frühen Einrichtungszeitpunkt im lokalen Dateisystem noch nicht existierte. 

    ​Lösung / Workaround: Der betroffene env_file-Block innerhalb der docker-compose.yml wurde vorübergehend auskommentiert, um den reinen Basisstart des Systems für die ersten Aufgaben ohne fehlende .env-Abhängigkeiten erfolgreich durchzuführen. 

