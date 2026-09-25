Hinweis zum Prozess:
Interne Anfragen sind grundsätzlich gemäß KB07 über den Service Desk aufzunehmen und zu steuern. Erst nach Prüfung und Vollständigkeitskontrolle erfolgt die Weiterleitung an die zuständige Fach- oder Supportgruppe.
Externe Supportanfragen können – sofern die Voraussetzungen erfüllt sind – direkt über definierte Vorlagen, Keywords oder Trigger verarbeitet werden.

KB19 Outlook Passwortabfrage lösen

Problembeschreibung:

Microsoft Outlook öffnet sich im Minutentakt mit einem Anmeldefenster und fragt permanent nach dem Passwort, obwohl die Anmeldedaten korrekt sind.
Lösung / Vorgehensweise:
Um die wiederkehrenden Passwortabfragen zu stoppen, gehen Sie wie folgt vor:
1.	Anmeldung prüfen: Schließen Sie Outlook, öffnen Sie die Windows-Anmeldeinformationsverwaltung (Credential Manager) über die Systemsteuerung und löschen Sie dort alle gespeicherten Outlook- oder Microsoft-Office-Anmeldedaten
2.	Cache leeren / Modern Auth: Starten Sie den Rechner neu und melden Sie sich im Office-Konto (z. B. über Word) einmal frisch mit Ihren aktuellen Unternehmensdaten an, um das Token im System zu erneuern.
3.	Ticket: Wenn das Problem kurz nach der Neuanmeldung erneut auftritt, liegt eventuell ein Sync-Problem im Postfach vor.
Ticketkriterien:
Erstellen Sie ein Ticket, falls die Passwortabfrage nach dem Leeren der Anmeldeinformationen weiterbesteht:
•	Welche Fehlermeldung zeigt das Anmeldefenster?
•	Betrifft dies nur Outlook oder auch andere Office-Anwendungen?

