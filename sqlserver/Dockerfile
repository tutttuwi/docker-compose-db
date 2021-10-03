FROM mcr.microsoft.com/mssql/server:2019-latest

USER root

COPY ./ddl/ /docker-entrypoint-initdb.d/
COPY ./entrypoint.sh /docker-entrypoint-initdb.d/
RUN chmod 775 /docker-entrypoint-initdb.d/entrypoint.sh

WORKDIR /var/www/app
ENV PATH $PATH:/opt/mssql-tools/bin

EXPOSE 1433

CMD /docker-entrypoint-initdb.d/entrypoint.sh & /opt/mssql/bin/sqlservr

