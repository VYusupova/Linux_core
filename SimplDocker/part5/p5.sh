
### ### ### ### ### ### ### ### ### 
### Part 5. Dockle              ###
### ### ### ### ### ### ### ### ### 

if [ $1 -eq "5" ]; then 
docker rmi -f nginx:ex05
docker build -t nginx:ex05 . 
	printf '\n\t\t\t\033[01;34m <<<   BILD NEW image   >>>\n\t\t '
docker images
docker run -d -p 80:81 nginx:ex05
	printf '\t\t\t\033[01;32m <<<   CHECK conteiner is alive  >>>\033[00m\n\t\t ---   --- \n' 
	docker ps
	printf '\n\t\t\t\033[01;31m <<<   CHECK dockle you image  >>>\033[00m\n\t\t ---   --- \n' 
export DOCKER_CONTENT_TRUST=1  # need to write CIS-DI-0005
dockle --ignore CIS-DI-0010 nginx:ex05
	printf '\n\t\t\t\033[01;32m <<<  let's see that the server is running  >>>\033[00m\n\t\t  \n' 
curl localhost:80
curl localhost/status
fi

if [ $1 -eq "51" ]; then 
        ID_CONTEINER=$(docker ps -q)
        echo 'id=$ID_CONTEINER'
	docker stop $ID_CONTEINER
	docker rm $ID_CONTEINER
fi
