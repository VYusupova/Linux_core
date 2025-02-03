#ps aux
#spawn-fcgi -p 8080 serv

#nginx -s reload
#nginx -g 'daemon off;'
#curl http://localhost:81

printf '\033[01;32m --- copy file in conteiner --- \033[00m\n'
docker cp server.c $(docker ps -q):/
docker cp nginx.conf $(docker ps -q):/etc/nginx/
