FROM jfloff/alpine-python

RUN addgroup uwsgi && adduser --disabled-password --ingroup uwsgi uwsgi

RUN pip install Flask uWSGI requests redis
WORKDIR /app
COPY app /app
COPY cmd.sh /

EXPOSE 9090 9191
USER uwsgi

CMD ["/cmd.sh"]
