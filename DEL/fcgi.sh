if [ $(docker ps -q) <> '' ]; then  docker stop $(docker ps -q)
fi
if [ $(docker ps -aq) <> '' ]; then  docker rm -f $(docker ps -aq)
fi


printf '\033[01;32m docker run -d -p 80:81 nginx>>\033[00m\n'


docker run -d -p 80:81 nginx

printf '\033[01;32m update >>\033[00m\n'
docker exec $(docker ps -q) apt-get update
docker exec $(docker ps -q) apt-get -y install gcc
docker exec $(docker ps -q) apt-get -y install libfcgi-dev
docker exec $(docker ps -q) apt-get -y install spawn-fcgi

#curl http://localhost:80



echo "--- --- reload nginx --- ---"
docker exec $(docker ps -q) nginx -s reload
gcc -o server server.c -lfcgi
docker exec $(docker ps -q) spawn-fcgi -p 8080 server
#./server

docker exec $(docker ps -q)  curl http://127.0.0.1:81
curl http://localhost:80
