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
