FROM nginx:alpine

COPY index.html sakerhetskrav.html favicon.svg /usr/share/nginx/html/

EXPOSE 80
