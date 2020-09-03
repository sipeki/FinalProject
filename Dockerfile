FROM nginx:stable

WORKDIR /etc/nginx/

RUN rm ./conf.d/default.conf

RUN mkdir /usr/share/nginx/html/petclinic

COPY ./dist/ /usr/share/nginx/html/petclinic/

RUN rm -f /usr/share/nginx/html/index.html

COPY ./dist/index.html /usr/share/nginx/html/

COPY ./frontend.conf ./conf.d/