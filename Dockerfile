FROM bitnami/postgresql:latest
USER root
RUN install_packages build-essential git && \
    cd /tmp && git clone https://github.com/pgvector/pgvector.git && \
    cd pgvector && \
    make PG_CONFIG=/opt/bitnami/postgresql/bin/pg_config && \
    make install PG_CONFIG=/opt/bitnami/postgresql/bin/pg_config && \
    rm -rf /tmp/pgvector
USER 1001
