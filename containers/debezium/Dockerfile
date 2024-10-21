FROM quay.io/debezium/connect:2.3.4.Final

ENV CONNECTOR_VERSION=2.12.0
ENV CONNECTOR_NAME=aiven-kafka-connect-s3

RUN curl --create-dirs -LO --output-dir /tmp/connector \
    https://github.com/aiven/s3-connector-for-apache-kafka/releases/download/v${CONNECTOR_VERSION}/${CONNECTOR_NAME}-${CONNECTOR_VERSION}.zip && \
    unzip -o /tmp/connector/${CONNECTOR_NAME}-${CONNECTOR_VERSION}.zip -d /tmp/connector && \
    mv /tmp/connector/${CONNECTOR_NAME}-${CONNECTOR_VERSION} /kafka/connect/${CONNECTOR_NAME} && \
    rm /tmp/connector/${CONNECTOR_NAME}-${CONNECTOR_VERSION}.zip