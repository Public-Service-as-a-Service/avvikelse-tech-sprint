FROM nginx:alpine

# Åtkomstkod för sakerhetskrav.html. Standardvärdet är bara en fallback
# för lokal körning — sätt alltid ett eget värde i DokPloy (Environment).
# Använd endast bokstäver, siffror och bindestreck.
ENV SAKERHETSKRAV_KOD=sundsvall-k3

COPY nginx/default.conf.template /etc/nginx/templates/default.conf.template
COPY index.html sakerhetskrav.html kod.html favicon.svg /usr/share/nginx/html/

EXPOSE 80
