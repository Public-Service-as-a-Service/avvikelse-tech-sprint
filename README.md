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
- `sakerhetskrav.html` — kravkatalogen Säkerhetskrav K3. Gäller generellt för
  alla lösningar som hanterar K3-klassad information inom VOF/IAF och är
  skyddad med åtkomstkod (se nedan).
- `kod.html` — kodsidan där besökaren anger åtkomstkoden.
- `nginx/default.conf.template` — nginx-konfiguration som gör åtkomstkontrollen.
- `favicon.svg` — sajtens favicon.

## Deploy

Sajten deployas via DokPloy. En webhook på detta repo triggar en ny deploy
vid varje push till `main`.

## Åtkomstskydd för säkerhetskravsidan

`sakerhetskrav.html` kräver en åtkomstkod. Kontrollen görs **server-side i
nginx** — sidan skickas aldrig till webbläsaren utan rätt kod:

1. Besökaren möts av `kod.html` och anger koden.
2. Koden sparas som en sessionscookie (`sakkod`) i webbläsaren.
3. nginx jämför cookien med miljövariabeln `SAKERHETSKRAV_KOD`
   (se `nginx/default.conf.template`). Rätt kod ⇒ sidan serveras;
   fel kod ⇒ tillbaka till kodsidan med felmeddelande.
4. Länken **Lås sidan** i sidhuvudet rensar cookien. Cookien försvinner
   också när webbläsaren stängs.

### Så hanteras koden i DokPloy

- Koden ligger **aldrig i git**. Den sätts som miljövariabel i DokPloy:
  öppna applikationen → **Environment** → lägg till
  `SAKERHETSKRAV_KOD=<din-kod>` → spara och **redeploya**.
- Vid containerstart substituerar nginx-imagens entrypoint in värdet i
  `nginx/default.conf.template` (standardmekanismen för filer under
  `/etc/nginx/templates/` i `nginx:alpine`) och skriver resultatet till
  `/etc/nginx/conf.d/default.conf`.
- **Byta kod** = ändra variabeln i DokPloy och redeploya — ingen kodändring
  eller ny commit krävs.
- `Dockerfile` innehåller ett standardvärde (`sundsvall-k3`) som endast är en
  fallback för lokal körning. Sätt alltid ett eget värde i DokPloy.
- Begränsningar att känna till: koden är gemensam (ingen individuell
  inloggning eller loggning), den skickas som cookie och förutsätter därför
  HTTPS (vilket DokPloys Traefik-proxy sköter), och den får bara innehålla
  bokstäver, siffror och bindestreck eftersom värdet substitueras in i
  nginx-konfigurationen. Själva kravkatalogen innehåller inga
  personuppgifter eller K3-data — skyddet är en åtkomstbarriär för en
  intern styrande handling, inte ett skydd för klassad information.

## Uppdatera sprintloggen

Under sprintveckan fylls sektionen **Sprintlogg** (`#logg` i `index.html`) på
dag för dag: byt ut `Fylls på under sprinten…` mot en kort sammanfattning av
dagen och ta bort `pending`-klassen på dagens `log-entry` så markören tänds.
