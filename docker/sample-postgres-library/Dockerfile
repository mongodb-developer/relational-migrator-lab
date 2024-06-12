FROM postgres:13

ENV POSTGRES_USER postgres
ENV POSTGRES_PASSWORD postgres

COPY /docker/sample-postgres-library/init /docker-entrypoint-initdb.d
RUN chmod u+x /docker-entrypoint-initdb.d/*.sh