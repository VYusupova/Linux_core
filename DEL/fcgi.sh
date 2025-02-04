if [ $(docker ps -q) <> '' ]; then  docker stop $(docker ps -q)
fi
if [ $(docker ps -aq) <> '' ]; then  docker rm -f $(docker ps -aq)
fi

printf '\033[01;32m docker run -d -p 80:81 nginx>>\033[00m\n'


docker run -d -p 80:81 nginx

printf '\033[01;32m update >>\033[00m\n'
docker exec $(docker ps -q) apt-get update

printf '\033[01;32m install gcc >>\033[00m\n'
docker exec $(docker ps -q) apt-get -y install gcc

printf '\033[01;32m install libfcgi-dev >>\033[00m\n'
docker exec $(docker ps -q) apt-get -y install libfcgi-dev

printf '\033[01;32m install install spawn-fcgi >>\033[00m\n'
docker exec $(docker ps -q) apt-get -y install spawn-fcgi

printf '\033[01;32m --- copy file in conteiner server.c  && nginx.conf >>--- \033[00m\n'
docker cp server.c $(docker ps -q):/
docker cp nginx.conf $(docker ps -q):/etc/nginx/
docker exec $(docker ps -q) ls      # Проверяем что он появился


docker exec -it $(docker ps -aq) gcc -o server server.c -lfcgi
docker exec $(docker ps -q) spawn-fcgi -p 8080 server

echo "--- --- reload nginx --- ---"
docker exec $(docker ps -q) nginx -s reload
#./server

docker exec $(docker ps -q)  curl http://127.0.0.1:81
curl http://localhost:80

# Если во время перезапуска возникнет ошибка с PID попробовать полностью рестертануть docker exec $(docker ps -q) service nginx start
