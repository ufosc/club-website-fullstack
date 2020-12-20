FROM node:14 AS frontend

RUN mkdir /app && mkdir /builddir
WORKDIR /builddir

COPY frontend/ /builddir/

RUN yarn && \
    yarn run build

FROM nginx:latest

COPY --from=frontend /builddir/build/ /usr/share/nginx/html/
COPY ./ufopensource.club.conf /etc/nginx/conf.d/default.conf

