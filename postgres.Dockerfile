FROM index.docker.io/tecnativa/duplicity
RUN apk add --no-cache postgresql
ENV JOB_200_WHAT='pg_dump --no-owner --format c --file "$SRC/$PGDATABASE.pgdump"' \
    JOB_200_WHEN='daily monthly' \
    JOB_700_WHAT='rm $SRC/$PGDATABASE.pgdump' \
    JOB_700_WHEN='daily monthly' \
    PGHOST=db
