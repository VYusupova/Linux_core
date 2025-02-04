FROM nginx
#LABEL maintainer="lymondka@student.school-21.ru"

COPY ./nginx/nginx.conf ./etc/nginx/
COPY ./server.c ./

# Устанавливаем зависимости
RUN apt-get update ; apt install -y gcc libfcgi-dev spawn-fcgi; gcc -o server.fcgi server.c -lfcgi; 
   
CMD spawn-fcgi -p 8080 server.fcgi && nginx -g 'daemon off;'
