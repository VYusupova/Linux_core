if [ $1 -eq '0' ]; then
echo "1  - show images         - docker images"
echo "2  - show run conteiners - docker ps"
echo "3  - show all conteiners - docker ps -a"
echo "4 - run conteiner       - docker run -d -p 80:81 nginx"
echo "5 - deleted all stoped conteiner - docker rm  \$(docker ps -q)"
echo "6 - deleted all  conteiner       - docker rm -f  \$(docker ps -aq)"
echo "7 - deleted all  images       - docker rmi -f  \$(docker images -q)"
echo "8 - exec in conteiner command    - docker exec -it \$(docker ps -aq) cat /etc/nginx/nginx.conf"
echo "                                 - docker exec -it \$(docker ps -aq) nginx -version"
echo "install docker exec \$(docker ps -q)  apt-get -y install libfcgi-dev"
echo "9 - look what hhtp  - curl http://localhost:80"
echo "show ID conteiner - \$(docker ps -aq)"
fi

if [ $1 -eq '1' ]; then docker images
fi
if [ $1 -eq '2' ]; then docker ps
fi
if [ $1 -eq "3" ]; then docker ps -a
fi
if [ $1 -eq "6" ]; then docker rm -f $(docker ps -aq)
fi
if [ $1 -eq "7" ]; then docker rmi -f  $(docker images -q)
fi

if [ $1 -eq "8" ]; then docker exec -it $(docker ps -aq) cat /etc/nginx/nginx.conf
fi

--Ex 04 -- 
docker stop $(docker ps -q)         # остановить запущенные контейнеры
docker rm -f $(docker ps -aq)       # Убираю все контейнеры 
docker rmi -f $(docker images -q)   # Убираю все образы
docker pull nginx                   # Скачиваю новый nginx 
docker run -d -p 80:81 nginx        # запускаю с мапингом портов
docker cp server $(docker ps -q):/  # переносим сервер в контейнер
docker exec $(docker ps -q) ls      # Проверяем что он появился 

# Установить внутрь контейнера spqwn-fcgi и все для компиляции сервера 
# Для начала обновимся 
docker exec $(docker ps -q) apt-get update 
docker exec $(docker ps -q) apt-get install -y spawn-fcgi  libfcgi-dev gcc
# можно попробовать через одну команду это сделать docker exec $(docker ps -q) apt-get update && apt-get install -y spawn-fcgi  libfcgi-dev gcc

 docker exec $(docker ps -q) gcc -o server server.c -lfcgi  # компилируем файл server.c
 # изменяем файл конфига
docker cp nginx.config $(docker ps -q):/etc/nginx/          # переносим файл конфига в контейнер 
docker exec $(docker ps -q) nginx -s reload                 # перезапускаем 
# Если во время перезапуска возникнет ошибка с PID попробовать полностью рестертануть docker exec $(docker ps -q) service nginx start

docker exec $(docker ps -q) spawn-fcgi -p 8080 server      # запускаею на порту 8080 получаю ошибку 127, Error 2 говорит о том что файла нет 

--Ex 04  -- END -- 
