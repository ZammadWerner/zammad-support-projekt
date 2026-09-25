Hinweis zum Prozess:
Interne Anfragen sind grundsätzlich gemäß KB07 über den Service Desk aufzunehmen und zu steuern. Erst nach Prüfung und Vollständigkeitskontrolle erfolgt die Weiterleitung an die zuständige Fach- oder Supportgruppe.
Externe Supportanfragen können – sofern die Voraussetzungen erfüllt sind – direkt über definierte Vorlagen, Keywords oder Trigger verarbeitet werden.
Problembeschreibung
Mitarbeitende melden, dass ihr Benutzerkonto gesperrt wurde und keine Anmeldung an den Windows-Clients oder Fachanwendungen mehr möglich ist, oder sie fordern Unterstützung bei abgelaufenen Kennwörtern an.
KB11 – Passwortrichtlinien und Sperrung des Benutzerkontos
Typische Ursachen / Einordnung
•	Fehlerhafte Eingaben: Das Kennwort wurde mehrfach hintereinander falsch eingegeben (Auslösen der Account-Sperrungs-Richtlinie im Active Directory).
•	Ablauf des Kennworts: Die maximale Gültigkeitsdauer des Passworts wurde überschritten und vorab nicht rechtzeitig geändert.
•	Hintergrunddienste/Mobile Geräte: Veraltete gespeicherte Passwörter auf Smartphones (z. B. für E-Mail oder WLAN), die im Hintergrund ständige Authentifizierungs-Fehlversuche generieren und das Konto immer wieder automatisch sperren.
Prüfschritte Service Desk
1.	Eingang der Störungsmeldung prüfen und auf Vollständigkeit der Pflichtangaben kontrollieren.
2.	Prüfen, ob eine gültige Vorlage genutzt wurde oder ob es sich um eine interne Anfrage handelt.
3.	Validieren, ob die Vorgaben gemäß KB07 eingehalten wurden (Eindeutige Titelzeile, Beschreibung mit Anforderer und exaktem Windows-Anmeldenamen).
4.	Identitätsprüfung des Anrufers / Meldenden gemäß den internen Sicherheitsvorgaben sicherstellen (Verhinderung von Social Engineering).
5.	Keine eigene technische Entsperrung durch den Service Desk; das Ticket wird direkt an die zuständige Supportgruppe (Benutzerverwaltung / IT-Security) übergeben.
Technische Prüfung und Lösung (Benutzerverwaltung)
1.	Prüfung des Kontostatus im Active Directory (Gesperrt, Kennwort abgelaufen, deaktiviert).
2.	Bei wiederkehrenden Sperrungen: Analyse der Audit-Logs auf dem Domänencontroller, um die Quelle der Fehlversuche zu identifizieren (z. B. fehlerhaftes Exchange-Profil).
3.	Konto manuell entsperren bzw. ein initiales Einmalkennwort vergeben (mit der erzwungenen Option "Kennwort muss bei der nächsten Anmeldung geändert werden").
4.	Dem Anwender das initiale Passwort über einen sicheren, definierten Kommunikationsweg mitteilen.
Weiterleitung / Ticket-Routing
•	Titelformat: IT-Support Service Desk - Benutzerverwaltung
•	Zielgruppe: Benutzerverwaltung / User-Helpdesk (UHD)

