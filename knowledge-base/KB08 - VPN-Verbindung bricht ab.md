Arbeitsprozess und Vorgaben für den Ticketprozess
Interne Anfragen sind grundsätzlich gemäß KB07 über den Service Desk aufzunehmen, um zu steuern. Erst nach Prüfung und Vollständigkeit erfolgt die Weiterleitung an die zuständige Fach- und Supportgruppe. Externe Supportanfragen können, sofern die Voraussetzungen erfüllt sind, direkt über definierte Vorlagen Keywords oder Trigger automatisiert werden.
KB08 – VPN-Verbindung bricht ab
Problembeschreibung
Mitarbeitende im Homeoffice oder im Außendienst melden wiederkehrende Verbindungsabbrüche zur VPN-Gegenstelle, wodurch der Zugriff auf interne Netzlaufwerke und Fachanwendungen blockiert wird.
Typische Ursachen / Einordnung
•	Netzwerkeinflüsse: Instabile lokale WLAN-Verbindungen oder temporäre Internet-Aussetzer beim Provider.
•	Client-Konfiguration: Veraltete VPN-Client-Versionen oder fehlerhafte Routing-Tabellen.
•	Authentifizierung: Zeitüberschreitungen (Timeouts) bei der Token- oder Zertifikatsprüfung.
Prüfschritte Service Desk
1.	Eingang der Störungsmeldung prüfen und auf Vollständigkeit der Pflichtangaben kontrollieren.
2.	Prüfen, ob eine gültige Vorlage genutzt wurde oder ob es sich um eine interne Anfrage handelt.
3.	Validieren, ob die Vorgaben gemäß KB07 eingehalten wurden (Eindeutige Titelzeile, Beschreibung mit Anforderer, betroffener Benutzer, verwendete VPN-Software und Zeitpunkte der Abbrüche).
4.	Keine eigene technische Fehlersuche durch den Service Desk; das Ticket wird direkt an die zuständige Supportgruppe (Netzwerk-Administration) übergeben.
Technische Prüfung und Lösung (Netzwerk Support)
1.	Benutzer und genutzten Standort (Homeoffice / Mobil) im Detail prüfen.
2.	Prüfen, ob allgemeine Störungen am VPN-Gateway vorliegen.
3.	Fehlermeldung und Logfiles des VPN-Clients auswerten.
4.	Verbindungstest (Ping / Traceroute) zur Gegenstelle veranlassen.
5.	Bei Zertifikatsproblemen Übergabe an IT-Security / Identity Management.
Weiterleitung / Ticket-Routing
•	Titelformat: IT-Support Service Desk - Netze
•	Zielgruppe: Netzwerk-Administration / Firewall-Management

