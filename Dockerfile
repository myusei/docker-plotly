FROM alpine

RUN apk --update add python3 postgresql-libs && \
    apk add --virtual .build-deps python3-dev gcc musl-dev postgresql-dev && \
    pip3 install --no-cache plotly flask sqlalchemy psycopg2 && \
    apk --purge del .build-deps && \
    mkdir /app
ADD src/server.py /app/

ENTRYPOINT ["python3"]
CMD ["/app/server.py"]
