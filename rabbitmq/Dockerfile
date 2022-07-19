ARG RABBIT_VERSION
FROM rabbitmq:${RABBIT_VERSION}

COPY rabbitmq.conf /etc/rabbitmq
COPY definitions.json /etc/rabbitmq
COPY enabled_plugins /etc/rabbitmq

EXPOSE 5672
RUN rabbitmq-plugins enable --offline rabbitmq_shovel && rabbitmq-plugins enable --offline rabbitmq_shovel_management

RUN chown rabbitmq:rabbitmq /etc/rabbitmq/rabbitmq.conf /etc/rabbitmq/definitions.json

RUN rm -rf /etc/localtime
RUN ln -s /usr/share/zoneinfo/Europe/Moscow /etc/localtime

CMD ["rabbitmq-server"]
