FROM python:3.6-alpine
WORKDIR app
ADD . .

ENV MONGO mongo_host
ENV MONGO_PORT mongo_port
ENV RMQ_HOST rabbitmq
ENV RMQ_QUEUE rabbitmq
ENV RMQ_USERNAME rabbitmq
ENV RMQ_PASSWORD changeit
ENV CHECK_INTERVAL 60s
ENV EXCLUDE_URLS '.*github.com'
ENV URL 'https://vitkhab.github.io/search_engine_test_site/'

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 8000
ENTRYPOINT ["/bin/sh", "entrypoint.sh"]
