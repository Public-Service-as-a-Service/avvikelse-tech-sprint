# avvikelse-tech-sprint

Webbplats för den tekniska utvecklingssprinten kring **avvikelsehantering** inom
välfärdssektorn i Sundsvalls kommun, 10–14 augusti.

Sprinten syftar till att implementera en så komplett version som möjligt av
avvikelsehanteringen — baserad på registreringsdelen och den av verksamheten
godkända AI-demo-applikationen — som grund för kommande fokuserade
utvecklingssprintar tillsammans med verksamheten.

## Innehåll

- `index.html` — sprintsidan som en fristående statisk sida (ingen build,
  inga beroenden). Öppna direkt i webbläsaren eller servera som statisk fil.
- `sakerhetskrav.html` — kravkatalogen Säkerhetskrav K3.
- `favicon.svg` — sajtens favicon.

## Deploy

Sajten deployas via DokPloy. En webhook på detta repo triggar en ny deploy
vid varje push till `main`.

## Uppdatera sprintloggen

Under sprintveckan fylls sektionen **Sprintlogg** (`#logg` i `index.html`) på
dag för dag: byt ut `Fylls på under sprinten…` mot en kort sammanfattning av
dagen och ta bort `pending`-klassen på dagens `log-entry` så markören tänds.
