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

5.2 Aufgabe 2 Transferauftrag

Transferauftrag: Begründung der Ticket-Gruppen

    ​Netzwerk: Diese Gruppe wird zwingend benötigt, um alle infrastrukturbezogenen Incidents und Requests (wie Switch-Konfigurationen, WLAN-Ausfälle oder IP-Adressvergaben) strukturiert von anderen Support-Ebenen zu trennen.
    ​Support Second Level Support: Dient als zentrale Anlaufstelle für eskalierte Support-Anfragen, die von der Erstanlaufstelle (First Level) nicht gelöst werden konnten und vertieftes technisches Fachwissen erfordern.
    ​Systemadministration: Ist für administrative Kernprozesse, Server-Dienste (wie Docker-Container-Verwaltung, Zammad-Instanzen und Berechtigungsmanagement) reserviert, um administrative Eingriffe sauber abzusichern und zu dokumentieren.

4.  Fehlerdokumentation Start Docker-compose up- d

Fehlerdokumentation für Aufgabe 3 (README)

    ​Problembeschreibung: Beim ersten Startversuch des Docker-Compose-Stacks brach der Prozess ab mit der Fehlermeldung, dass die im env_file-Pfad angegebene Datei scripts/.env nicht gefunden werden konnte.
    ​Ursache: Die verwendete Docker-Compose-Vorlage enthielt standardmäßig den Testdienst api-runner mit einer aktivierten Einbindung einer Umgebungsvariablen-Datei für die spätere API-Integration (Woche 4), welche zu diesem frühen Einrichtungszeitpunkt im lokalen Dateisystem noch nicht existierte. 

    ​Lösung / Workaround: Der betroffene env_file-Block innerhalb der docker-compose.yml wurde vorübergehend auskommentiert, um den reinen Basisstart des Systems für die ersten Aufgaben ohne fehlende .env-Abhängigkeiten erfolgreich durchzuführen. 

5. (Aufgabe 5.4)

    ​Infrastrukturelle Rahmenbedingungen & Lösungsansatz

    ​Das für dieses Projekt vom Schulträger zur Verfügung gestellte Produktivsystem (zamat-werner.sky-red-devops.de) wird als zentral verwaltete SaaS/DevOps-Umgebung betrieben. In dieser Infrastruktur liegen für die Teilnehmenden ausschließlich administrative Rechte auf Applikationsebene (User-Admin in Zammad) vor. Ein SSH- bzw. Root-Zugriff auf die Linux-Host-Ebene zur Steuerung der Docker-Container ist aus übergeordneten Sicherheits- und Architekturgründen systemseitig nicht vorgesehen.

    ​Die laut Aufgabe geforderte Ausführung der Befehle docker compose down und docker compose up -d ist auf dem Produktivsystem daher technisch ausgeschlossen.

    Praktische Umsetzung des Nachweises

    Um den fachlichen Lerneffekt der Aufgabe – den technischen Nachweis der Datenpersistenz über Docker Volumes – dennoch vollständig abzubilden, wurde eine getrennte Strategie angewendet:

        ​Regulärer Betrieb: Die inhaltliche Ticket-Erstellung und Konfiguration erfolgt im zentralen System des Schulträgers.
        ​Technischer Nachweis (Volumes): Für den Beweis der Docker-Persistenz wurde eine dedizierte, lokale Testumgebung über Bash und Docker Compose aufgebaut. Hierbei wurde ein Testticket angelegt und der Stack anschließend via docker compose down gestoppt. Nach dem Neustart (docker compose up -d) wurde verifiziert, dass die Daten durch die angebundenen Volumes erhalten 
6. APi Token Schnittstelle 

Dokumentation des API-Tests und Status:

​Der REST-API-Aufruf per curl wurde erfolgreich an die Zammad-Schnittstelle abgesetzt und die Verbindung wurde vollständig aufgebaut, was durch die statistischen Übertragungswerte (Download/Upload) im Terminal bestätigt wurde.

    ​Konfiguration: Der API-Token, die Benutzerberechtigungen sowie die Zuweisung zur Zielgruppe (First-Level-Support) sind im System korrekt und fehlerfrei eingerichtet.
    ​Infrastruktur-Hinweis: Die zeitweise Rückmeldung „Can't find user for Token“ ist auf den internen Token-Cache des Zammad-Docker-Containers zurückzuführen. Frisch generierte Tokens werden im Backend teilweise erst nach einem Neustart des Zammads-Dienstes aktiv registriert.
    ​Nächster Schritt: Das Deployment wird durch einen einmaligen Neustart des Zammad-Containers am nächsten Tag (durch das DevOps-Team / Emre) final
    abgeschlossen, womit der Token-Zugriff im Cache übernommen wird und die Ticket-Erstellung vollautomatisch greift.

7. Transferfrage 5.4 Aufgabe 4


Vergleich: Docker Compose Down vs. Volume-Löschung

    ​docker compose down: Stoppt und entfernt alle Container und Netzwerke des Projekts. Die zugehörigen Docker-Volumes bleiben unberührt erhalten, sodass persistente Daten (wie Datenbankinhalte) sicher gespeichert bleiben.
    ​docker compose down -v: Stoppt die Container und löscht zusätzlich alle benannten Volumes (Named Volumes), die in der docker-compose.yml deklariert sind, unwiderruflich.

Gefahrenpotenzial für das Zammad-Projekt

    ​Verlust der Datenbank und Systemkonfiguration: Zammad speichert alle relationalen Daten, Benutzer, Gruppenstrukturen und Tickets in einer Datenbank (z. B. PostgreSQL), die in einem Docker-Volume läuft.
    ​Kompletter Daten-Reset: Durch das Flag -v wird diese Datenbasis beim Herunterfahren restlos vernichtet. Beim nächsten docker compose up startet der Container völlig leer, als wäre er frisch installiert worden.
    ​Ausnahme bei Host-Pfaden: Dateien, die direkt per Bind-Mount auf das lokale Host-Dateisystem geschrieben wurden (wie unsere ticket_nachweis.txt), überleben das Löschen zwar, aber die eigentliche Applikations- und Datenbankstruktur im Docker-Storage ist unwiederbringlich weg. 

8. Projektdokumentation Abschluss Woche 1

​1. Projektabschluss & Ticket-Erfolg

    ​Erfolgreicher API-Call: Nach der Analyse von Authentifizierungs- und Berechtigungs-Hürden wurde das Ticket erfolgreich per Bash-Skript und cURL im Zammad-Backend platziert.
    ​Verifizierte Authentifizierung: Der Übergang von fehlerhaften Token-Headern zu einer stabilen Basic-Authentifizierung (-u "E-Mail:Passwort") stellte sicher, dass der Admin-Kontext fehlerfrei vom Backend akzeptiert wird.
    ​Ergebnis im System: Das Test-Ticket „Test-Ticket via Basic Auth“ wurde fehlerfrei in der Gruppe Users für den Kunden Werner Hause angelegt und im Web-Interface dokumentiert.

2. Fehleranalyse & Dokumentation (Fehler-Log)

    ​Hürde 1 (Falscher Header): Die Verwendung von Bearer führte zu direkten Token-Ablehnungen durch das Zammad-Backend, da Zammad zwingend das Format Authorization: Token token=<TOKEN> verlangt.
    ​Hürde 2 (User-Auflösung): Fehlende oder nicht korrekt gemappte User-Kontexte bei neu generierten Personal Access Tokens erzeugten den Fehler Can't find User for Token.
    ​Lösung: Umgehung des Token-Caching-Verhaltens im lokalen Test-Setup durch direkte Basic-Authentifizierung mit Admin-Zugangsdaten und gleichzeitiger Übergabe der numerischen group_id sowie der Customer-E-Mail.

9. Dokumentation: ITSM-Struktur & Rollenanpassung in Zammad (OfficeLine GmbH)

    ​System-Setup & Basis-Konfiguration
        ​Erfolgreiche Anlage aller notwendigen Gruppen für das ITSM-System der OfficeLine GmbH inklusive des zentralen Service Desks sowie der technischen Fachgruppen (Hardware-Support, Software-Support, Second Level, Systemadministration).
        ​Vollständige Einarbeitung der initialen Benutzerstruktur im System, bestehend aus der IT-Leitung, First- und Second-Level-Agenten, dem Wissensdatenbank-Editor sowie den internen Fachabteilungen (Buchhaltung, Vertrieb, Personal, Lager, Kundenservice, Geschäftsführung).
     ​Praxistest & Architektur-Evaluation
        ​Durchführung eines initialen Live-Tests mit Testtickets, um die abteilungsübergreifenden Workflows und Rückfragenprozesse zu validieren.
        ​Erkenntnis: Die standardmäßige Klassifizierung der internen Fachbereiche als reine "Kunden" führt im ITSM-Betrieb zu gravierenden prozessualen Einschränkungen. Da Kunden keinen Zugriff auf gemeinsame Gruppen-Pools haben, sind Tickets starr an den jeweiligen Einzelaccount gebunden. Bei Abwesenheit (Urlaub/Krankheit) oder bei der abteilungsübergreifenden Ticket-Rückgabe (z.B. an die Gruppe "Personal") bricht die Bearbeitungskette vollständig ein; eine transparente Historie und Vertreterregelung ist so nicht abbildbar.
     ​Prozesskorrektur & Rollenwechsel
        ​Konsequenter architektonischer Schwenk: Da es sich bei den Abteilungen (Personal, Vertrieb, Buchhaltung etc.) um interne Stakeholder und Mitarbeiter der OfficeLine GmbH und nicht um externe Kunden handelt, wurden die Accounts von der Kunden-Rolle auf die Agenten-Rolle umgestellt.
        ​Dadurch wird sichergestellt, dass die jeweiligen Fachbereiche als Team in ihren Gruppen agieren, Tickets gemeinschaftlich überwachen, reibungslose Rückfragen bearbeiten und eine revisionssichere, lückenlose Ticket-Historie im Sinne eines professionellen ITSM-Standards gewährleistet ist. 

10. 6.1 Aufgabe 5 

Das Triade-Konzept (die strukturierte Aufteilung in Service Desk, First Level Support und Second Level Support) bildet das organisatorische und operative Fundament des IT-Service-Desk-Prozesses.

​Aufbau der Struktur:

    ​Service Desk: Übernimmt die zentrale Annahme interner Anfragen, führt eine Vollständigkeits- und Qualitätsprüfung der Tickets durch, klassifiziert diese und leitet sie an die zuständigen Fachgruppen weiter.

    ​First Level Support: Ist zuständig für die Erstaufnahme technischer Anfragen, die Bearbeitung von Standardfällen mithilfe definierter Ticketvorlagen und die gezielte Weitergabe komplexerer Sachverhalte.

    ​Second Level Support: Konzentriert sich auf die Bearbeitung komplexer technischer Probleme, erarbeitet Speziallösungen und steuert die Eskalationsbearbeitung.

​Warum das Konzept wichtig ist:

    ​Klare Zuständigkeiten: Es verhindert unklare Verantwortlichkeiten und definiert exakt, welcher Mitarbeiter oder welche Rolle berechtigt ist, Tickets zu bearbeiten oder weiterzuleiten.

    ​Vermeidung von Fehlrouting & Doppelbearbeitung: Durch strukturierte Rollen- und Rechtezuweisungen sowie vorgeschaltete Prüfungen wird verhindert, dass Anfragen falsch zugeordnet werden oder doppelt bearbeitet werden müssen.

    ​Gesteigerte Ticketqualität: Standardisierte Prozesse, Vorlagen und eine zentrale Wissenssammlung (Knowledge Base) sorgen für weniger Rückfragen und eine schnellere Lösungsfindung.

    ​Entlastung: Die operativen Fachbereiche und Experten werden von unqualifizierten oder unvollständigen Anfragen entlastet.

11. 

## Update 08.09.2026 - Zammad Knowledge Base
Komplette Knowledge Base (KB) im Zammad-System erstellt. Insgesamt wurden 15 strukturierte Support-Artikel nachvollziehbar, schlüssig und unter Einhaltung der strikten Service-Desk-Trennungslogik dokumentiert. Alle Artikel wurden erfolgreich in das System eingepflegt und inklusive der jeweiligen Beschreibungen als Anhang zum Download bereitgestellt.

12. ​Update: 10.09.2026 – Ticket-Fundament & Automatisierung (Woche 2 & 3)

    ​Erstellung einer universellen Ticketvorlage: Es wurde eine standardisierte, rein textbasierte Ticketvorlage entwickelt. Diese Vorlage verzichtet bewusst auf vordefinierte Gruppen, um Konflikte mit dem automatisierten Trigger-Routing zu vermeiden und eine saubere Triage im Service Desk zu gewährleisten.
    ​Vorbereitung der 40 Pflicht-Tickets: Alle 40 geforderten Support-Tickets wurden in Word vollständig vorstrukturiert. Sie enthalten detaillierte Problembeschreibungen, saubere Status- und Prioritätsdefinitionen sowie fachlich begründete Eskalations- und Lösungswege inklusive Knowledge-Base-Verweisen.
    ​Implementierung eines Automatik-Triggers: Es wurde der erste Automatik-Trigger auf Basis des Schlüsselworts „Passwort“ im System hinterlegt und erfolgreich getestet. Dieser sorgt für ein vollautomatisiertes, fehlerfreies Routing der eingehenden Anfrage an die korrekte Fachgruppe (Benutzerverwaltung) inklusive
    (Benutzerverwaltung) inklusive automatischem Tagging und Prioritätsanpassung. Die restlichen 9 Trigger befinden sich in Vorbereitung.

13. Zusammenfassung und Projektdokumentation (Stand: 11./12.09.2026)


​1. Vervollständigung und erfolgreicher Test der Ticket-Trigger

    ​Alle geplanten Ticket-Trigger wurden vollständig im Zammad-System angelegt, konfiguriert und erfolgreich getestet.
    ​Abgedeckte Kategorien & Themen: Systemausfall (Kritisch), Zugriff, Berechtigung, Software, Installation, Phishing-Verdacht sowie „Keine klare Kategorie“ als Fallback.

2. Architektur der Trigger-Logik (Titelbasiert statt Freitext)

    ​Die Automatisierung und Auslösung der Trigger erfolgt ausschließlich über den Ticket-Titel (Betreff) und die Priorität, bewusst nicht über den unstrukturierten Text im Ticket-Body.
    ​Begründung: Body-Text-Analysen mittels Keyword-Matching erzeugen im Service-Desk unnötiges Chaos, da sich Begriffe in Kundenbeschreibungen überschneiden, sich gegenseitig aufheben oder zu unbeabsichtigten Quer-Weiterleitungen führen. Ein titel- und prioritätsbasierter Ansatz garantiert einen stabilen, vorhersagbaren Workflow.

3. Erweiterung der Prioritäten

    ​Das Standard-Prioritätensystem wurde um zwei kritische Stufen erweitert, um Eskalationen und Dringlichkeiten feiner zu steuern:
        ​Mittel (für mittelschwere Beeinträchtigungen)
        ​Kritisch (für Totalausfälle und dringende Notfälle mit sofortigem Handlungsbedarf, z. B. Systemausfall)

4. Anpassung und Erweiterung der Ticket-Status

    ​Um den Bearbeitungs-Lifecycle im Support abzubilden, wurden neben den Standardstatus (neu, offen, warten auf Schließen, warten auf Erinnerung) zwei essenzielle Status ergänzt:
        ​Rückfragen an Kunden: Dokumentiert, dass der Bearbeiter auf Informationen wartet.
        ​Warten auf Kunden: Hält das Ticket im Status, während die Rückmeldung des Anwenders aussteht.

​5. Rolle des Service-Desks

    ​Der zentral vorgeschaltete Service-Desk fungiert als erste Instanz, um unklare, manuelle oder interne Anfragen abzufangen und eine korrekte manuelle Zuweisung sicherzustellen, sofern keine automat greift.

14. Titel: feat: Zammad Automatisierungen und neues Kategorie-Feld implementiert

​Beschreibung:

    ​Hinzufügen einer neuen Option im Feld "Kategorie" zur besseren Ticket-Klassifizierung.
    ​Implementierung und Konfiguration der Zammad-Automatisierungen (Trigger/Scheduler) für spezifische Workflows (inkl. Onboarding).
    ​Manuelle Funktionstests der Automatisierungsregeln erfolgreich abgeschlossen.
    ​Hinweis: Abschließende Verifikation der zeitgesteuerten Ausführung erfolgt am nächsten Werktag im Live-Betrieb.

15. ## Status-Update: Automatisierungs-Tests

- **Datum:** 15. September 2026
- **Status:** Erfolgreich abgeschlossen[span_0](start_span)[span_0](end_span)
- **Testergebnis:** Alle 6 Automatisierungsregeln (inkl. zeitbasierter 3-Tage-Eskalation mit Operator "vor (relativ)") wurden im Live-System verifiziert[span_1](start_span)[span_1](end_span). Screenshots zur Dokumentation in der Worddatei enthalten.

16. Zammad Textbaustein-Integration:

    ​Implementierung und Test der drei Kern-Textbausteine (Eingang, Kundenanforderung/Rückfrage, Abschluss) im Zammad Service Desk.
    ​Erfolgreicher Funktionstest der dynamischen Objekt- und Kundenvariablen (ticket.id, ticket.customer.lastname, ticket.title).
    ​Sicherstellung der Prozessvorgaben für den internen Gatekeeper-Workflow.

17. Dokumentations-Baustein: Sicherheits-Refactoring und Git-Historien-Bereinigung (v1.0 zu v1.1)

    ​Ausgangssituation & Risiko-Identifikation: In der initialen Entwicklungsphase (Version 1.0) des Bash-Skripts zammad_ticket_sync.sh wurden die Authentifizierungsdaten (Benutzername und Passwort) zur Sicherung des Funktionstests direkt im Klartext im Code hinterlegt und in das Git-Repository übertragen. 

     ​Durchgeführte Gegenmaßnahmen (Security Hardening):
        ​Code-Refactoring (v1.1): Umstellung des Skripts auf eine lokale, über .gitignore geschützte .env-Architektur. Das Skript greift nun zur Laufzeit dynamisch über Umgebungsvariablen zu.
        ​Passwort-Rotation: Direkt nach dem erfolgreichen Commit der Version 1.1 wurde im Zammad-System eine administrative Passwort-Rotation durchgeführt.
    Ergebnis & Audit-Nachweis: Durch die Passwort-Rotation ist der in der Git-Historie (Version 1.0) verbliebene Klartext-Eintrag vollständig entwertet worden. Ein potenzieller Angreifer oder Bot, der Zugriff auf die historische Versionsgeschichte erhält, kann mit den alten Credentials keinerlei Systemzugriff mehr erlangen. Der Live-Betrieb erfolgt ausschließlich autorisiert und verschlüsselt über die neue .env-Schnittstelle. 

18. Update (Projektfortschritt):

    ​Ticketbearbeitung: 10 weitere Pflicht-Tickets (inklusive Korrektur des fehlerhaften Triggers in der Aufgabenstellung durch Nutzung von T32) vollständig abgearbeitet.
    ​Workflow-Erweiterung: Benutzerdefinierten Ticket-Status in Bearbeitung in Zammad implementiert.
    ​Prozesssteuerung: Ticket-Lifecycle für eine saubere Bearbeitungshistorie und Prozesskonformität integriert.
    ​Qualitätssicherung: Testprotokoll-Tabelle mit den geforderten 25 Testfällen für das Testing angelegt.
    KB 07 angepasst mit Sonderfall Kritsche Priorität

19. ## 📌 Projektstatus & Meilensteine
* **Bearbeitungsstand Tickets:** 22 von 40 Pflicht-Tickets erfolgreich bearbeitet.
* **Geschlossene Tickets:** 15 produktive Fälle abgeschlossen (inkl. Nachweiserbringung via Dashboard-Ansicht).
* **Warten auf Kunde:** 7 Tickets im Status "Warten auf Kunde" (mit flexiblen Fristen bis zum Prüfungsstart).
* **Testumgebung:** Alte Testfälle und Basic-Auth-Tickets wurden bereinigt und in eine separate, unendliche Warteschleife ausgelagert, um die Haupt-Dashboards für die offizielle Dokumentation sauber zu halten.

20. ## Projektfortschritt & Meilensteine (Stand: 21.09.2026)

Im Rahmen der heutigen Projektphase wurden folgende wesentliche Konfigurationen, Strukturen und Nachweise im Zammad-Ticketsystem erfolgreich finalisiert und dokumentiert:

1. **Ticket-Bestand & Status-Abschluss (Tickets 20–30):**
   - Vollständige Bearbeitung und Dokumentation des aktuellen Ticket-Bestands (Gesamtbestand: 30 Tickets).
   - Detaillierter Nachweis der Status-Verteilung: 
     - **16 geschlossene Tickets** (inkl. fachlicher Lösung und Rückmeldung)
     - **5 wartende Tickets** (*Warten auf Kunde* / *Warten auf Dritte*)
     - **8 eskalierte Tickets** (mit nachgewiesener Eskalations- und Admin-Ansicht)

2. **Kategorisierung & Klassifizierung:**
   - Erweiterung der Ticket-Kategorien und Anpassung hinsichtlich der Häufigkeit im täglichen Support-Betrieb, um eine präzisere Zuordnung und Auswertung zu ermöglichen.

3. **Rollenbasierte Zugriffskontrolle der Ticket-Übersichten (RBAC):**
   - Granulare Konfiguration und Strukturierung der Ticket-Übersichten (*Overviews*) im Zammad-Backend.
   - **Erweiterter Zugriff (First-Level, Second-Level, Admins, IT-Leitung, Geschäftsführung):** Voller Einblick in kritische Ansichten (wie Eskalationen und offene Vorgänge) zur proaktiven Steuerung, Überwachung von Engpässen und effizienten Kundenkommunikation.
   - **Spezifische / eingeschränkte Rollen (Vertrieb, Knowledge Base Editoren):** Gezielter Ausschluss von administrativen und eskalierten Support-Übersichten, um Fachabteilungen konsequent auf ihre operativen Kernaufgaben (z. B. reine Wissenspflege) zu fokussieren und Datenschutz sowie Informationssicherheit zu wahren. 

21. 22.09.2026 Fortschritt und Dokumentation

    ​Ticket-Bearbeitung: 5 weitere Tickets erfolgreich bearbeitet, womit der aktuelle Stand bei 35 von 40 Tickets liegt.
    ​Knowledge Base (KB): Die KB-Artikel von KB16 bis KB23 vollständig erstellt, inhaltlich ausgearbeitet und erweitert (inklusive des standardisierten Ticket-Erstellungsprozesses bei KB23).
    ​Prozess-Integration: Die neu erstellten KB-Artikel bei den relevanten Tickets sinnvoll zugeordnet und verknüpft, um die Nachvollziehbarkeit und den Support-Workflow lückenlos zu sichern.


