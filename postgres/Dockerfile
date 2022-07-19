ARG POSTGRES_VERSION
FROM postgres:${POSTGRES_VERSION}

COPY /docker-entrypoint-initdb.d/init-user-db.sh /docker-entrypoint-initdb.d/init-user-db.sh

RUN rm -rf /etc/localtime
RUN ln -s /usr/share/zoneinfo/Europe/Moscow /etc/localtime