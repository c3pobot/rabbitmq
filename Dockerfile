FROM alpine/curl as builder
RUN mkdir /data
RUN curl -L -o /data/elixir-1.16.3.ez "https://github.com/noxdafox/rabbitmq-message-deduplication/releases/download/0.6.4/elixir-1.16.3.ez"
RUN curl -L -o /data/rabbitmq_message_deduplication-0.6.4.ez "https://github.com/noxdafox/rabbitmq-message-deduplication/releases/download/0.6.4/rabbitmq_message_deduplication-0.6.4.ez"

FROM rabbitmq:4.0-management
RUN echo "[rabbitmq_message_deduplication,rabbitmq_management,rabbitmq_prometheus]." > /etc/rabbitmq/enabled_plugins
COPY --from=builder /data /plugins
