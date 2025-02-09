FROM nginx:latest
#LABEL maintainer="lymondka@student.school-21.ru"

COPY ./nginx/nginx.conf ./etc/nginx/
COPY ./server.c ./

# Устанавливаем зависимости  apt-get upgrade ; 
RUN apt-get update && apt install -y gcc libfcgi-dev spawn-fcgi ; gcc -o server.fcgi server.c -lfcgi && rm -rf /var/lib/apt/lists ; 


    
RUN chown -R nginx:nginx /etc/nginx/nginx.conf; \
    chown -R nginx:nginx /var/cache/nginx; \
    chown -R nginx:nginx /home; \
    touch /var/run/nginx.pid; \
    chown -R nginx:nginx /var/run/nginx.pid; \
    chmod u-s /usr/bin/gpasswd; \
    chmod u-s /usr/bin/newgrp; \
    chmod u-s /bin/su; \
    chmod u-s /bin/mount; \
    chmod u-s /bin/umount; \
    chmod u-s /usr/bin/chsh; \
    chmod u-s /usr/bin/chfn; \
    chmod u-s /usr/bin/chsh; \
    chmod 255 /usr/bin/expiry; \
    chmod 255 /usr/bin/wall; \
    chmod 255 /sbin/unix_chkpwd; \
    chmod 255 /usr/bin/chage; \
    chmod 755 /usr/bin/passwd

USER nginx

HEALTHCHECK --interval=3s --timeout=3s CMD spawn-fcgi -p 8080 server.fcgi  || exit 1
    

