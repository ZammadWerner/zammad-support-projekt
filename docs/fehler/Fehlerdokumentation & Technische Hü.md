Fehlerdokumentation & Technische Hürden
​1. Tatsächliche Projekthürden & Fehlerbehebung

​API-Schnittstellen & Authentifizierung (Zammad API / Outlook-Integration):
​Beschreibung: Bei der Anbindung der Zammad-API (gemäß der Outlook Output.json-Struktur) funktionierte die Authentifizierung über den initialen API-Token-Schlüssel zunächst nicht wie erwartet.
​Analyse & Behebung: Nach mehreren Testläufen (ca. zehn Versuchen) wurde der Authentifizierungsmechanismus pragmatisch und erfolgreich auf die Kombination aus Benutzername und Passwort umgestellt. Dadurch konnte die Schnittstelle reibungslos in Betrieb genommen und die Funktionalität nachgewiesen werden.
.

 ​Sicherheitsvorfall (Git-Repository & Klartext-Credentials):
​Beschreibung: In der initialen Version (v1.0) des Skripts (Ticket_Zammad_Ticket_Sync.sh) wurden Benutzername und Passwort im Klartext hinterlegt.
​Behebung / Gegenmaßnahme: In Version 1.1 korrigiert durch Auslagerung in eine .env-Konfigurationsdatei und Einbindung via source-Befehl. Parallel dazu wurde das Zammad-Passwort unmittelbar im System geändert, um die alte Version 1.0 zu entwerten.
. 

 ​Infrastruktur-Ausfall (Datenbank & Restore-Szenario):
​Beschreibung: Potenzieller Totalausfall der Zammad-Datenbank durch Server-Neusetzung beim Schulungsträger ohne vorhandenes Restore-Volumen.
​Behebung / Gegenmaßnahme: Sicherstellung der Business Continuity durch eigeninitiierte Web- und Windows-Backups, wodurch die Wiederherstellung innerhalb einer Woche gewährleistet wurde.
.  2. Identifizierte mögliche Fehlerquellen & Präventivmaßnahmen

​Ressourcen-Engpass & OOM-Kills (Elasticsearch / Docker):
​Mögliche Fehlerquelle: Der Zammad-Suchdienst Elasticsearch ist extrem RAM-hungrig. Wenn dem Docker-Host zu wenig Arbeitsspeicher zugewiesen ist, beendet das Host-System (Out-Of-Memory-Killer) den Container unerwartet.
​Prävention: Vorab-Prüfung des Host-Systems und sauberes Sizing der virtuellen Ressourcen gemäß den Zammad-Systemvoraussetzungen vor dem Ausrollen der Docker-Compose. Yml
Berechtigungskonflikte bei persistenten Volumes (Linux UID/GID):
​Mögliche Fehlerquelle: Falsche Lese-/Schreibrechte auf dem Linux-Host-System für die gemounteten Datenbank- oder Storage-Volumes. Dies führt dazu, dass PostgreSQL keine Daten schreiben oder Zammad keine Dateianhänge speichern kann.
​Prävention: Striktes Überprüfen und Setzen der korrekten Owner-Rechte auf Linux-Ebene vor dem initialen Start der Container.
Port-Kollisionen beim Reverse Proxy (Netzwerk-Routing):
​Mögliche Fehlerquelle: Die für Zammad benötigten Standard-Ports (z. B. 80, 443 oder 8080) sind auf dem Schulungsserver bereits durch andere Applikationen belegt, wodurch der Zammad-Container nicht binden und starten kann.
​Prävention: Port-Analyse via Kommandozeile (netstat / ss) im Vorfeld und gegebenenfalls individuelles Port-Mapping in der Docker-Konfiguration.
Endlosschleifen durch Trigger-Fehlkonfiguration (Mail-Loop):
​Mögliche Fehlerquelle: Falsch konfigurierte Automatisierungen im Zammad. Sendet das System z. B. eine automatische Antwort an ein anderes Ticketsystem, das ebenfalls automatisch antwortet, entsteht ein Ping-Pong-Effekt, der das System flutet.
​Prävention: Sorgfältige Definition der Trigger-Bedingungen (Ausschluss von System-Adressen/No-Reply) und Nutzung der systeminternen Loop-Protection.
Abbruch der E-Mail-Synchronisation (IMAP/SMTP-Timeouts):
​Mögliche Fehlerquelle: Verbindungsabbrüche, geänderte Verschlüsselungsprotokolle (TLS) oder ablaufende Passwörter beim E-Mail-Provider blockieren den Ticket-Import auf Applikationsebene.
​Prävention: Einrichtung dedizierter, nicht ablaufender API- bzw. App-Passwörter für den E-Mail-Kanal und regelmäßige Überprüfung des Kanal-Status im Zammad-Admin-Panel.