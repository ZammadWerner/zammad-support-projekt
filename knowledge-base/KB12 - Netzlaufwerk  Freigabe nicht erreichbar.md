Hinweis zum Prozess:
Interne Anfragen sind grundsätzlich gemäß KB07 über den Service Desk aufzunehmen und zu steuern. Erst nach Prüfung und Vollständigkeitskontrolle erfolgt die Weiterleitung an die zuständige Fach- oder Supportgruppe.
Externe Supportanfragen können – sofern die Voraussetzungen erfüllt sind – direkt über definierte Vorlagen, Keywords oder Trigger verarbeitet werden.
KB12 – Netzlaufwerk / Freigabe nicht erreichbar
Problembeschreibung
Mitarbeitende melden, dass auf bestimmte Netzlaufwerke, Abteilungsfreigaben oder Projektordner nicht mehr zugegriffen werden kann (Fehlermeldung: "Pfad nicht gefunden" oder "Zugriff verweigert").
Typische Ursachen / Einordnung
•	Netzwerkanbindung / VPN: Der Client hat keine Verbindung zum internen Firmennetzwerk oder dem entsprechenden Dateiserver.
•	Berechtigungsänderungen: Dem Benutzer oder der Benutzergruppe wurden im Rahmen von Umstrukturierungen die NTFS- oder Freigaberechte entzogen.
•	Server- oder Pfadänderungen: Der Dateiserver wurde migriert oder der UNC-Pfad (Freigabename) hat sich geändert.
Prüfschritte Service Desk
1.	Eingang der Störungsmeldung prüfen und auf Vollständigkeit der Pflichtangaben kontrollieren.
2.	Prüfen, ob eine gültige Vorlage genutzt wurde oder ob es sich um eine interne Anfrage handelt.
3.	Validieren, ob die Vorgaben gemäß KB07 eingehalten wurden (Eindeutige Titelzeile, Beschreibung mit Anforderer, betroffener Benutzer, genauer UNC-Pfad des Laufwerks und verwendeter Verbindungsweg z.B. VPN/LAN).
4.	Keine eigene technische Fehlersuche durch den Service Desk; das Ticket wird direkt an die zuständige Supportgruppe (Infrastruktur / Speicher-Administration) übergeben.
Technische Prüfung und Lösung (Infrastruktur / Speicher-Administration)
1.	Überprüfung der Erreichbarkeit des Dateiservers im lokalen Netz bzw. über das VPN-Gateway.
2.	Kontrolle der aktuellen NTFS- und Freigabeberechtigungen für den betroffenen Benutzer bzw. die AD-Gruppe.
3.	Prüfung, ob der Laufwerksbuchstabe korrekt gemappt ist oder das Netzlaufwerk neu verbunden werden muss.
4.	Bei Servermigrationen oder Pfadänderungen Bereitstellung des aktualisierten UNC-Pfads oder Anpassung der Anmeldeskripte.
Weiterleitung / Ticket-Routing
•	Titelformat: IT-Support Service Desk - Speicher/Infrastruktur
•	Zielgruppe: Infrastruktur-Support / Server-Administration


