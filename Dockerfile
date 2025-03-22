FROM postgres:15

LABEL MAINTAINER="Jaiber Camacho <jaibercamacho@gmail.com>"

# Actualizar las llaves GPG y los repositorios
RUN apt-get update -y && apt-get install -y gnupg2 curl
RUN curl https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ bookworm-pgdg main" > /etc/apt/sources.list.d/pgdg.list

# Actualizar e instalar postgis
RUN apt-get update && \
    apt-get dist-upgrade -y && \
    apt-get install -y postgresql-15-postgis-3 && \
    rm -rf /var/lib/apt/lists/*

