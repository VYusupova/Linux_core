
### ### ### ### ### ### ### ### ### 
### Part 4. Свой докер          ###
### ### ### ### ### ### ### ### ### 

if [ $1 -eq "41" ]; then   # delete images
        docker rmi -f nginx:ex04
	docker build -t nginx:ex04 .
	docker images
	
fi

if [ $1 -eq '42' ]; then  # run docker conteiner
printf '2  - RUN Docker \n'
	docker run -d -p 80:81 -v ./nginx/nginx.conf:/etc/nginx/nginx.comf nginx:ex04
	docker ps
	docker exec -it $(docker ps -q) /bin/sh
	
fi

if [ $1 -eq '41' ]; then  # stop docker conteiner
	docker stop do5_EX04
	docker rm do5_EX04
	docker ps -a
fi
