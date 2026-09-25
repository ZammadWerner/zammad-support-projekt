#!/bin/bash

# Lade die versteckten Zugangsdaten aus der .env
source .env

ZAMMAD_URL="https://zammadwerner.skyered-devops.de/api/v1/tickets"
OUTPUT_FILE="new_ticket_output.json"

echo "Erstelle Ticket per Basic Auth..."

curl -s -X POST "$ZAMMAD_URL" \
  -u "$ZAMMAD_USER:$ZAMMAD_PASSWORD" \
  -H "Content-Type: application/json" \
  -d '{
        "title": "Test-Ticket via Basic Auth",
        "group_id": 1,
        "customer": "werner.hause@skyered-education.de",
        "article": {
          "subject": "Test",
          "body": "Erfolgreich via Benutzerdaten"
        }
      }' -o "$OUTPUT_FILE"

echo "Fertig."
